# Doctor Booking System

The **Doctor Booking System** is an API-based Laravel application designed for managing patient-doctor appointments. The system divides users into two roles, **Patients** and **Doctors**, ensuring authentication and role-based access to services. Unauthorized users are restricted from performing any actions.

## Features

### Users
- **Patient**: Can book, update, and view their appointments.
- **Doctor**: Can view and manage their appointments, including approving, rejecting, or postponing them.

## Modules

### 1. Appointment Module (For Patients)

Patients can interact with the following APIs:

1. **Create Appointment**:
   - Patients can book appointments.
   - Two patients cannot book the same time slot.
   - The appointment will be set to **RSVP** until the doctor approves.

2. **Update Status Of Appointment**:
   - Patients can cancel, reject, or postpone their appointments.

3. **View List of Appointments**:
   - Patients can view all of their appointments.
   - They can filter appointments by date.

### 2. Doctor Module (For Doctors)

Doctors can manage their schedule with these APIs:

1. **View Appointments**:
   - Doctors can view all appointments related to them.
   - They can filter appointments by date.

2. **Update Status Of Appointment**:
   - Doctors can cancel, reject, or approve appointments.

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Utkarsh1244p/restoran.git
   cd restoran

2. **Install PHP Dependencies**
Install the required PHP dependencies using Composer:
   ```bash
   composer install

3. **Install Node.js Dependencies**

   ```bash
   npm install

4. **Run Migrations**
I made many migrations in project, you can use them by running the migrations:
   ```bash
   php artisan migrate

5. **Run the Development Server**
Start the Laravel development server:
   ```bash
   php artisan serve

6. **Run Vite Development Server**
In a separate terminal window, start the Vite development server:
   ```bash
   npm run dev
