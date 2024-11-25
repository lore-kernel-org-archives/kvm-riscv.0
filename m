From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 25 Nov 2024 14:53:46 +0100
Subject: [kvm-unit-tests PATCH v3 4/4] riscv: sbi: Add SSE extension tests
In-Reply-To: <20241125115452.1255745-5-cleger@rivosinc.com>
References: <20241125115452.1255745-1-cleger@rivosinc.com>
 <20241125115452.1255745-5-cleger@rivosinc.com>
Message-ID: <20241125-01fae59d27bb81fff71e794e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 12:54:48PM +0100, Cl?ment L?ger wrote:
> Add SBI SSE extension tests for the following features:
> - Test attributes errors (invalid values, RO, etc)
> - Registration errors
> - Simple events (register, enable, inject)
> - Events with different priorities
> - Global events dispatch on different harts
> - Local events on all harts

And now also double trap and mask/unmask.

Thanks,
drew

