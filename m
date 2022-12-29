From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 29 Dec 2022 21:52:21 +0100
Subject: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <9acea262dec3511e9cf63081506f0bd7@kernel.org>
References: <20221227130249.1650197-1-pbonzini@redhat.com>
 <9acea262dec3511e9cf63081506f0bd7@kernel.org>
Message-ID: <4d73d1b9-2c28-ab6a-2963-579bcc7a9e67@redhat.com>
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

This is now refs/heads/kvm-hw-enable-refactor in 
https://git.kernel.org/pub/scm/virt/kvm/kvm.git.

The commits for this series start at hash fc471e831016.

Paolo


