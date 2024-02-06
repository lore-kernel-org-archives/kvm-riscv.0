From: Sean Christopherson <seanjc@google.com>
Date: Tue, 6 Feb 2024 12:36:22 -0800
Subject: [PATCH v8 10/10] KVM: selftests: Add a basic SEV smoke test
In-Reply-To: <20240203000917.376631-11-seanjc@google.com>
References: <20240203000917.376631-1-seanjc@google.com> <20240203000917.376631-11-seanjc@google.com>
Message-ID: <ZcKYRsNUAngWGy2a@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 02, 2024, Sean Christopherson wrote:
> +int main(int argc, char *argv[])
> +{
> +	TEST_REQUIRE(is_kvm_sev_supported());

This also needs

	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));

to handle the case where the platform supports SEV, i.e. /dev/sev exists, but
KVM doesn't support SEV, e.g. if TDP is disabled, if SEV was explicitly disabled
via module param, etc.

