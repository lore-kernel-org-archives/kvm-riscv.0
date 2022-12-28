From: Marc Zyngier <maz@kernel.org>
Date: Wed, 28 Dec 2022 11:22:10 +0000
Subject: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <20221227130249.1650197-1-pbonzini@redhat.com>
References: <20221227130249.1650197-1-pbonzini@redhat.com>
Message-ID: <9acea262dec3511e9cf63081506f0bd7@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-12-27 13:02, Paolo Bonzini wrote:
> Queued, thanks.  I will leave this in kvm/queue after testing 
> everything
> else and moving it to kvm/next; this way, we can wait for test results
> on other architectures.

Can you please make this a topic branch, and if possible based
on a released -rc? It would make it a lot easier for everyone.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

