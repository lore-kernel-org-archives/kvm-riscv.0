From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 4 Sep 2023 15:48:21 +0200
Subject: [PATCH v2 6/8] KVM: riscv: selftests: Add guest helper to get
 vcpu id
In-Reply-To: <23d13f60b5a2fd31b87ae78458507f46442fac3a.1693659382.git.haibo1.xu@intel.com>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <23d13f60b5a2fd31b87ae78458507f46442fac3a.1693659382.git.haibo1.xu@intel.com>
Message-ID: <20230904-db7e8ba933a271ef6aafa4b3@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 02, 2023 at 08:59:28PM +0800, Haibo Xu wrote:
> Add guest_get_vcpuid() helper to simplify accessing to per-cpu
> private data. The sscratch CSR was used to store the vcpu id.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/include/aarch64/processor.h | 4 ----
>  tools/testing/selftests/kvm/include/kvm_util_base.h     | 2 ++
>  tools/testing/selftests/kvm/lib/riscv/processor.c       | 8 ++++++++
>  3 files changed, 10 insertions(+), 4 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

