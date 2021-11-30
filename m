From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Nov 2021 17:07:36 +0100
Subject: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out
 arch callback hook
In-Reply-To: <4826a7e2dbecc5d57323d18d725d6d69@kernel.org>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-11-seanjc@google.com>
 <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
 <875ytjbxpq.wl-maz@kernel.org>
 <be1cf8c7-ed87-b8eb-1bca-0a6c7505d7f8@redhat.com>
 <3490c50e-50d2-f906-3383-b87e14b14fab@redhat.com>
 <4826a7e2dbecc5d57323d18d725d6d69@kernel.org>
Message-ID: <3f5adff7-f321-0688-c817-84975ebd3d14@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/30/21 13:04, Marc Zyngier wrote:
>>>
>>> I have "queued" it, but that's just my queue - it's not on kernel.org 
>>> and it's not going to be in 5.16, at least not in the first batch.
>>>
>>> There's plenty of time for me to rebase on top of a fix, if you want 
>>> to send the fix through your kvm-arm pull request.? Just Cc me so 
>>> that I understand what's going on.
>>
>> Since a month has passed and I didn't see anything related in the
>> KVM-ARM pull requests, I am going to queue this patch.? Any conflicts
>> can be resolved through a kvmarm->kvm merge of either a topic branch
>> or a tag that is destined to 5.16.
> 
> Can you at least spell out *when* this will land?

It will be in kvm/next as soon as I finish running tests on it, which 
may take a couple more days because I'm updating my machines to newer 
operating systems.

> There is, in general, a certain lack of clarity about what you are queuing,
> where you are queuing it, and what release it targets.

Ok, thanks for the suggestion.  Generally speaking:

- kvm/master is stuff that is merged and will be in the next -rc, right 
now 5.16-rc4.  It shouldn't ever rewind (though it may happen, it is rare)

- kvm/next is stuff that is merged and will be in the next merge window, 
right now 5.17.  It also shouldn't rewind.

- kvm/queue is stuff that the submitter shouldn't care about, and that 
other people should only care about to check for conflicts.  When I say 
I "queued" a patch it goes in kvm/queue, and there's time to remove it 
if something breaks.

Regarding this series:

- I am queuing it up to this patch

- I am queuing it to kvm/next, meaning it targets 5.17

- it looks like the next one (11/43) triggers a known AMD errata, so I'm 
holding on the rest until we understand if it actually does, and if so 
if AMD AVIC is doomed.  For the time being, it will stay in kvm/queue.

Paolo

