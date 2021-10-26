From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 26 Oct 2021 18:12:06 +0200
Subject: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out
 arch callback hook
In-Reply-To: <875ytjbxpq.wl-maz@kernel.org>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-11-seanjc@google.com>
 <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
 <875ytjbxpq.wl-maz@kernel.org>
Message-ID: <be1cf8c7-ed87-b8eb-1bca-0a6c7505d7f8@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26/10/21 17:41, Marc Zyngier wrote:
>> This needs a word on why kvm_psci_vcpu_suspend does not need the
>> hooks.  Or it needs to be changed to also use kvm_vcpu_wfi in the PSCI
>> code, I don't know.
>>
>> Marc, can you review and/or advise?
> I was looking at that over the weekend, and that's a pre-existing
> bug. I would have addressed it independently, but it looks like you
> already have queued the patch.

I have "queued" it, but that's just my queue - it's not on kernel.org 
and it's not going to be in 5.16, at least not in the first batch.

There's plenty of time for me to rebase on top of a fix, if you want to 
send the fix through your kvm-arm pull request.  Just Cc me so that I 
understand what's going on.

Thanks,

Paolo


