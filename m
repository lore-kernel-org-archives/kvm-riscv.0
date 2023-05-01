From: Palmer Dabbelt <palmer@rivosinc.com>
Date: Mon, 01 May 2023 15:44:36 -0700
Subject: [PATCH v2] RISC-V: Align SBI probe implementation with spec
In-Reply-To: <20230427163626.101042-1-ajones@ventanamicro.com>
References: <20230427163626.101042-1-ajones@ventanamicro.com>
Message-ID: <168298107617.32296.1350302899241039554.b4-ty@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Thu, 27 Apr 2023 18:36:26 +0200, Andrew Jones wrote:
> sbi_probe_extension() is specified with "Returns 0 if the given SBI
> extension ID (EID) is not available, or 1 if it is available unless
> defined as any other non-zero value by the implementation."
> Additionally, sbiret.value is a long. Fix the implementation to
> ensure any nonzero long value is considered a success, rather
> than only positive int values.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: Align SBI probe implementation with spec
      https://git.kernel.org/palmer/c/41cad8284d5e

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


