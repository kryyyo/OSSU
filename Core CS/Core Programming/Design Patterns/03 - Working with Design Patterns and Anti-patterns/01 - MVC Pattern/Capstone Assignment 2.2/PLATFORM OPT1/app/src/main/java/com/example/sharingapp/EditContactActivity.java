package com.example.sharingapp;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import java.util.Observer;

/**
 * Editing a pre-existing contact consists of deleting the old contact and adding a new contact with the old
 * contact's id.
 * Note: You will not be able contacts which are "active" borrowers
 */
public class EditContactActivity extends AppCompatActivity implements Observer {

    private ContactList contactList = new ContactList();
    private Contact contact;
    private EditText email;
    private EditText username;
    private Context context;

    private ContactController contactController = new ContactController(contact);
    private ContactListController contactListController = new ContactListController(contactList);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_contact);

        context = getApplicationContext();
        contactListController.loadContacts(context);

        Intent intent = getIntent();
        int pos = intent.getIntExtra("position", 0);

        contact = contactListController.getContact(pos);

        username = (EditText) findViewById(R.id.username);
        email = (EditText) findViewById(R.id.email);

        username.setText(contactController.getUsername());
        email.setText(contactController.getEmail());
    }

    public void saveContact(View view) {

        String emailStr = email.getText().toString();

        if (emailStr.equals("")) {
            email.setError("Empty field!");
            return;
        }

        if (!emailStr.contains("@")){
            email.setError("Must be an email address!");
            return;
        }

        String usernameStr = username.getText().toString();
        String id = contactController.getId(); // Reuse the contact id

        // Check that username is unique AND username is changed (Note: if username was not changed
        // then this should be fine, because it was already unique.)
        if (!contactListController.isUsernameAvailable(usernameStr) && !(contactController.getUsername().equals(usernameStr))) {
            username.setError("Username already taken!");
            return;
        }

        Contact updatedContact = new Contact(usernameStr, emailStr, id);

        if(!contactListController.editContact(contact, updatedContact, context)) return;

        // End EditContactActivity
        finish();
    }

    public void deleteContact(View view) {
        if(!contactListController.deleteContact(contact, context))

        // End EditContactActivity
        finish();
    }
}