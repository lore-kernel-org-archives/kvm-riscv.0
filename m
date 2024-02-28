From: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Feb 2024 18:12:51 -0800
Subject: [PATCH v9 07/11] KVM: selftests: Allow tagging protected memory
 in guest page tables
In-Reply-To: <75d37243-e2a3-421a-b74f-ccbe307fef96@intel.com>
References: <20240223004258.3104051-1-seanjc@google.com> <20240223004258.3104051-8-seanjc@google.com>
 <75d37243-e2a3-421a-b74f-ccbe307fef96@intel.com>
Message-ID: <Zd6Wo0hQu11L4aPc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 28, 2024, Xiaoyao Li wrote:
> On 2/23/2024 8:42 AM, Sean Christopherson wrote:
> ...
> > diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> > new file mode 100644
> > index 000000000000..218f5cdf0d86
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> > @@ -0,0 +1,7 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> > +#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> 
> Since the file name is changed from kvm_host.h (in v7) to kvm_util_arch.h,
> we need to update it as well.
> 
> Ditto for other archs

Ugh, nice catch.  I'll fixup and force push (likely tomorrow).

> > +struct kvm_vm_arch {};
> > +
> > +#endif  // _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> 
> 

