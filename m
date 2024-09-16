From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 16 Sep 2024 12:49:31 +0200
Subject: [kvm-unit-tests PATCH v4 3/3] riscv: sbi: Add tests for HSM
 extension
In-Reply-To: <20240915183459.52476-4-jamestiotio@gmail.com>
References: <20240915183459.52476-1-jamestiotio@gmail.com>
 <20240915183459.52476-4-jamestiotio@gmail.com>
Message-ID: <20240916-cedb477964d0af321cea6bec@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 16, 2024 at 02:34:59AM GMT, James Raphael Tiovalen wrote:
...
> +static struct sbiret sbi_hart_suspend(uint32_t suspend_type, unsigned long resume_addr, unsigned long opaque)
> +{
> +	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND, suspend_type, resume_addr, opaque, 0, 0, 0);
> +}
> +

It's good to create these wrappers per the spec, i.e. use the parameter
name types from the spec to define the wrapper, but we should also
remember that if, like in this case, we force a parameter to be of a
certain type that we also add tests for when we use input outside the
expected range by using a "raw" ecall. See the last test of the DBCN
extension where we test a byte write with a word full of data to
ensure the SBI call does the right thing. We have to call sbi_ecall()
instead of sbi_dbcn_write_byte() to do that because sbi_dbcn_write_byte()
has been written to only accept uint8_t input.

So we'll need some sort of test for suspend where we pass a value
with high bits set for suspend_type when running the test on rv64.

Thanks,
drew

