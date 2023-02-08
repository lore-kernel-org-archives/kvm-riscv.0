From: Sean Christopherson <seanjc@google.com>
Date: Wed, 8 Feb 2023 14:48:51 +0000
Subject: [PATCH v2 3/6] KVM: x86: Remove the KVM_GET_NR_MMU_PAGES ioctl
In-Reply-To: <20230208140105.655814-4-thuth@redhat.com>
References: <20230208140105.655814-1-thuth@redhat.com>
 <20230208140105.655814-4-thuth@redhat.com>
Message-ID: <Y+O2U/x7zHzeVV6e@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 08, 2023, Thomas Huth wrote:
> The KVM_GET_NR_MMU_PAGES ioctl is quite questionable on 64-bit hosts
> since it fails to return the full 64 bits of the value that can be
> set with the corresponding KVM_SET_NR_MMU_PAGES call. Its "long" return
> value is truncated into an "int" in the kvm_arch_vm_ioctl() function.
> 
> Since this ioctl also never has been used by userspace applications
> (QEMU, Google's internal VMM, kvmtool and CrosVM have been checked),
> it's likely the best if we remove this badly designed ioctl before
> anybody really tries to use it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

