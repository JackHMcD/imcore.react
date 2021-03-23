import { configureStore, ThunkAction, Action, getDefaultMiddleware } from '@reduxjs/toolkit';
import chatReducer from './reducers/chats'
import messagesReducer from './reducers/messages'
import contactsReducer from './reducers/contacts'

export const store = configureStore({
  reducer: {
    chats: chatReducer,
    messages: messagesReducer,
    contacts: contactsReducer
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      immutableCheck: false
    })
});

export type RootState = ReturnType<typeof store.getState>;
export type AppThunk<ReturnType = void> = ThunkAction<
  ReturnType,
  RootState,
  unknown,
  Action<string>
>;