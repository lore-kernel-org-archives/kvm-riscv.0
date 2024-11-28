From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 28 Nov 2024 09:43:06 +0100
Subject: [PATCH v4 15/16] KVM: selftests: Use canonical $(ARCH) paths for
 KVM selftests directories
In-Reply-To: <20241128005547.4077116-16-seanjc@google.com>
References: <20241128005547.4077116-1-seanjc@google.com>
 <20241128005547.4077116-16-seanjc@google.com>
Message-ID: <20241128-d7a5061ce8160000cd5260bd@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2024 at 04:55:46PM -0800, Sean Christopherson wrote:
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

Acked-by: Andrew Jones <ajones@ventanamicro.com>

