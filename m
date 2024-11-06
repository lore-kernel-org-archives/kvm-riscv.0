From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 6 Nov 2024 09:34:40 +0100
Subject: [kvm-unit-tests PATCH 2/2] riscv: sbi: Improve spec version test
In-Reply-To: <20240911113338.156844-6-andrew.jones@linux.dev>
References: <20240911113338.156844-4-andrew.jones@linux.dev>
 <20240911113338.156844-6-andrew.jones@linux.dev>
Message-ID: <20241106-279caf8ceef5bb9e4005d1d5@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 01:33:41PM +0200, Andrew Jones wrote:
> SBI spec version states that bit 31 must be zero and doesn't say
> anything about bits greater than 31 (for rv64). Check that bit
> 31 is zero and assume all other bits are UNKNOWN, so mask them
> off before testing.

The spec has changed for the 3.0 release to also require bits 32 and up to
be zero for rv64. I'll send another version of this patch.

Thanks,
drew

