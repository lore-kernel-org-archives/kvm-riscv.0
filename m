From: Claudio Imbrenda <imbrenda@linux.ibm.com>
Date: Thu, 28 Nov 2024 09:25:46 +0100
Subject: [PATCH v4 15/16] KVM: selftests: Use canonical $(ARCH) paths
 for KVM selftests directories
In-Reply-To: <20241128005547.4077116-16-seanjc@google.com>
References: <20241128005547.4077116-1-seanjc@google.com>
	<20241128005547.4077116-16-seanjc@google.com>
Message-ID: <20241128092546.7a5b3f30@p-imbrenda>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 27 Nov 2024 16:55:46 -0800
Sean Christopherson <seanjc@google.com> wrote:

> Use the kernel's canonical $(ARCH) paths instead of the raw target triple
> for KVM selftests directories.  KVM selftests are quite nearly the only
> place in the entire kernel that using the target triple for directories,
> tools/testing/selftests/drivers/s390x being the lone holdout.
> 
> Using the kernel's preferred nomenclature eliminates the minor, but
> annoying, friction of having to translate to KVM's selftests directories,
> e.g. for pattern matching, opening files, running selftests, etc.
> 
> Opportunsitically delete file comments that reference the full path of the
> file, as they are obviously prone to becoming stale, and serve no known
> purpose.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

just one minor nit

[...]

> diff --git a/tools/testing/selftests/kvm/include/x86_64/svm_util.h b/tools/testing/selftests/kvm/include/x86/svm_util.h
> similarity index 94%
> rename from tools/testing/selftests/kvm/include/x86_64/svm_util.h
> rename to tools/testing/selftests/kvm/include/x86/svm_util.h
> index 044f0f872ba9..b74c6dcddcbd 100644
> --- a/tools/testing/selftests/kvm/include/x86_64/svm_util.h
> +++ b/tools/testing/selftests/kvm/include/x86/svm_util.h
> @@ -1,8 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * tools/testing/selftests/kvm/include/x86_64/svm_utils.h

this line clearly has to go ^

> - * Header for nested SVM testing

but I think this one can stay? ^


regardless, for the s390 part:

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> - *
>   * Copyright (C) 2020, Red Hat, Inc.
>   */
>  

[...]

