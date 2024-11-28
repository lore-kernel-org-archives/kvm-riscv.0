From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 28 Nov 2024 09:42:41 +0100
Subject: [PATCH v4 14/16] KVM: selftests: Provide empty 'all' and 'clean'
 targets for unsupported ARCHs
In-Reply-To: <20241128005547.4077116-15-seanjc@google.com>
References: <20241128005547.4077116-1-seanjc@google.com>
 <20241128005547.4077116-15-seanjc@google.com>
Message-ID: <20241128-24a975e227dd4b86393f21ed@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2024 at 04:55:45PM -0800, Sean Christopherson wrote:
> Provide empty targets for KVM selftests if the target architecture is
> unsupported to make it obvious which architectures are supported, and so
> that various side effects don't fail and/or do weird things, e.g. as is,
> "mkdir -p $(sort $(dir $(TEST_GEN_PROGS)))" fails due to a missing operand,
> and conversely, "$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH_DIR) ..." will
> create an empty, useless directory for the unsupported architecture.
> 
> Move the guts of the Makefile to Makefile.kvm so that it's easier to see
> that the if-statement effectively guards all of KVM selftests.
> 
> Reported-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/.gitignore   |   1 +
>  tools/testing/selftests/kvm/Makefile     | 336 +----------------------
>  tools/testing/selftests/kvm/Makefile.kvm | 334 ++++++++++++++++++++++
>  3 files changed, 340 insertions(+), 331 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/Makefile.kvm
>

Acked-by: Andrew Jones <ajones@ventanamicro.com>

