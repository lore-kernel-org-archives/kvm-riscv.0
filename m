From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 7 Aug 2024 15:37:27 +0200
Subject: [PATCH kvm-unit-tests] riscv: sbi: add dbcn write test
In-Reply-To: <20240807-ff37f5aa2c767c4b3b734cc0@orel>
References: <20240806-sbi-dbcn-write-test-v1-1-7f198bb55525@berkeley.edu>
 <20240807-2c3b28a78c80c6db80a80588@orel>
 <20240807-ff37f5aa2c767c4b3b734cc0@orel>
Message-ID: <20240807-bb9135bb41297039b3b7e135@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 07, 2024 at 02:29:31PM GMT, Andrew Jones wrote:
> On Wed, Aug 07, 2024 at 01:36:33PM GMT, Andrew Jones wrote:
> ...
> > I just tried 32-bit KVM and see that the DBCN write test fails the
> > 'write success' test. That may be a KVM bug.
> >
> 
> We can blame both KVM and kvmtool.
> 
> KVM sets sbiret.error to a0 and sbiret.value to a1 before exiting to
> userspace[1]. I think that comes from thinking about how a real ecall
> would set them. However, as this isn't an ecall, they should get set
> directly by userspace, not through registers. Also, we should initialize
> them to some known value before calling userspace, and zero is probably
> the best choice.

Thinking about this some more and discussing it with Anup, the best
choice for sbiret.error is to initialize it to SBI_ERR_NOT_SUPPORTED.
Doing that won't allow the test to pass with old kvmtool, but that's
OK. I'll send a KVM patch for that and the kvmtool patch.

Thanks,
drew

> 
> kvmtool neglects to set sbiret.error to SBI_SUCCESS on a successful write.
> QEMU does set it, so this failure shouldn't happen with QEMU, but I
> haven't tried it.
> 
> Patching both KVM and kvmtool is best, as it would allow the test to pass
> when running new KVM with old kvmtool and when running old KVM with new
> kvmtool.
> 
> [1] arch/riscv/kvm/vcpu_sbi.c:130
> 
> Thanks,
> drew
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

