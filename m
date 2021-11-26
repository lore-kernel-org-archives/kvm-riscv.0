From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Nov 2021 17:15:31 +0100
Subject: [PATCH 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
In-Reply-To: <20211126154020.342924-4-anup.patel@wdc.com>
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-4-anup.patel@wdc.com>
Message-ID: <9545cab7-6365-b20d-fc05-82ace6368661@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/26/21 16:40, Anup Patel wrote:
> We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile
> which will allow users to pass additional compile-time flags such
> as "-static".

Is this just for debugging?  I cannot understand if it's used in patch 4.

Paolo


