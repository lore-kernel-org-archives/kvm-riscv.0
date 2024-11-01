From: Mark Brown <broonie@kernel.org>
Date: Fri, 1 Nov 2024 13:07:57 +0000
Subject: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
In-Reply-To: <20241009154953.1073471-4-seanjc@google.com>
References: <20241009154953.1073471-1-seanjc@google.com>
 <20241009154953.1073471-4-seanjc@google.com>
Message-ID: <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 09, 2024 at 08:49:42AM -0700, Sean Christopherson wrote:
> Return a uint64_t from vcpu_get_reg() instead of having the caller provide
> a pointer to storage, as none of the vcpu_get_reg() usage in KVM selftests
> accesses a register larger than 64 bits, and vcpu_set_reg() only accepts a
> 64-bit value.  If a use case comes along that needs to get a register that
> is larger than 64 bits, then a utility can be added to assert success and
> take a void pointer, but until then, forcing an out param yields ugly code
> and prevents feeding the output of vcpu_get_reg() into vcpu_set_reg().

This commit, which is in today's -next as 5c6c7b71a45c9c, breaks the
build on arm64:

aarch64/psci_test.c: In function ?host_test_system_off2?:
aarch64/psci_test.c:247:9: error: too many arguments to function ?vcpu_get_reg?
  247 |         vcpu_get_reg(target, KVM_REG_ARM_PSCI_VERSION, &psci_version);
      |         ^~~~~~~~~~~~
In file included from aarch64/psci_test.c:18:
include/kvm_util.h:705:24: note: declared here
  705 | static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, uint64_t id)
      |                        ^~~~~~~~~~~~
At top level:
cc1: note: unrecognized command-line option ?-Wno-gnu-variable-sized-type-not-at
-end? may have been intended to silence earlier diagnostics

since the updates done to that file did not take account of 72be5aa6be4
("KVM: selftests: Add test for PSCI SYSTEM_OFF2") which has been merged
in the kvm-arm64 tree.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20241101/737fd895/attachment.sig>
