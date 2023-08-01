From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 1 Aug 2023 11:22:07 +0200
Subject: [PATCH v4.1 2/3] KVM: selftests: Add #define of expected KVM
 exit reason for ucall
In-Reply-To: <20230731203026.1192091-3-seanjc@google.com>
References: <20230731203026.1192091-1-seanjc@google.com>
 <20230731203026.1192091-3-seanjc@google.com>
Message-ID: <20230801-121c649de93d2bcd54af14c4@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 31, 2023 at 01:30:25PM -0700, Sean Christopherson wrote:
> Define the expected architecture specific exit reason for a successful
> ucall so that common tests can assert that a ucall occurred without the
> test needing to implement arch specific code.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/include/aarch64/ucall.h | 2 ++
>  tools/testing/selftests/kvm/include/riscv/ucall.h   | 2 ++
>  tools/testing/selftests/kvm/include/s390x/ucall.h   | 2 ++
>  tools/testing/selftests/kvm/include/x86_64/ucall.h  | 2 ++
>  4 files changed, 8 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

