From: Jarkko Sakkinen <jarkko@kernel.org>
Date: Fri, 26 Apr 2024 10:33:40 +0300
Subject: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <ZipyPYR8Nv_usoU4@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
 <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
 <ZipyPYR8Nv_usoU4@google.com>
Message-ID: <D0TVP8ILJMO0.HERRWR4PA7N6@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu Apr 25, 2024 at 6:09 PM EEST, Sean Christopherson wrote:
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");

This would work also for casual (but not seasoned) visitor in KVM code
as additionl documentation.

BR, Jarkko

