From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Dec 2022 12:58:33 +0100
Subject: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <9acea262dec3511e9cf63081506f0bd7@kernel.org>
References: <20221227130249.1650197-1-pbonzini@redhat.com>
 <9acea262dec3511e9cf63081506f0bd7@kernel.org>
Message-ID: <55a31d67-b9d0-1a62-1c60-f86b48a34a8b@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/28/22 12:22, Marc Zyngier wrote:
> 
>> Queued, thanks.? I will leave this in kvm/queue after testing everything
>> else and moving it to kvm/next; this way, we can wait for test results
>> on other architectures.
> 
> Can you please make this a topic branch, and if possible based
> on a released -rc? It would make it a lot easier for everyone.

Yes, I will (it will be based on 6.2-rc1 + pull request for rc2 that I'm 
preparing + x86 changes that this conflicts with).

Paolo


