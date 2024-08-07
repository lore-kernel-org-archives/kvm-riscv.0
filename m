From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 7 Aug 2024 14:29:31 +0200
Subject: [PATCH kvm-unit-tests] riscv: sbi: add dbcn write test
In-Reply-To: <20240807-2c3b28a78c80c6db80a80588@orel>
References: <20240806-sbi-dbcn-write-test-v1-1-7f198bb55525@berkeley.edu>
 <20240807-2c3b28a78c80c6db80a80588@orel>
Message-ID: <20240807-ff37f5aa2c767c4b3b734cc0@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 07, 2024 at 01:36:33PM GMT, Andrew Jones wrote:
...
> I just tried 32-bit KVM and see that the DBCN write test fails the
> 'write success' test. That may be a KVM bug.
>

We can blame both KVM and kvmtool.

KVM sets sbiret.error to a0 and sbiret.value to a1 before exiting to
userspace[1]. I think that comes from thinking about how a real ecall
would set them. However, as this isn't an ecall, they should get set
directly by userspace, not through registers. Also, we should initialize
them to some known value before calling userspace, and zero is probably
the best choice.

kvmtool neglects to set sbiret.error to SBI_SUCCESS on a successful write.
QEMU does set it, so this failure shouldn't happen with QEMU, but I
haven't tried it.

Patching both KVM and kvmtool is best, as it would allow the test to pass
when running new KVM with old kvmtool and when running old KVM with new
kvmtool.

[1] arch/riscv/kvm/vcpu_sbi.c:130

Thanks,
drew

