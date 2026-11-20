Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F09B606A320
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i252RBj4;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DjfmR+rC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+hfLYlXplccqafYqy9E4trI1t8jrhei1ukFb1d0XBU0=; b=i252RBj48g5g9S9cGHT4o6xfFI
	xEe4mFeuM7dAmTWzl01Pl7rxhRFJoU/zhVhz9cKo3VwKmlnuWSUsnJ4XJFrJrCvKpm5I083vyrA2T
	C3mVrw3ervHIp6+dKdn9+J5+U1pBy5cHKFXz7x1EDdbRpBzWBuI3S+CnBIa25lH2hRIEDVJr3GNuW
	7225qb+ibFm6td1uA1cYRNlHv4NZ+yqxZlCX/n1o21INdTgDdvLTg1he2ZwCi7S/mUZfPY3Eeu9gM
	QYbWXWbvZJNrw2X4Go6OoIIAl5PtKmKUnZ1HtqZdpkbOLEH5w9gXgjwm8jFGzkcd+GiIWT3KDnov+
	hC9IvlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPYn-0000000FFSP-2g6T;
	Fri, 20 Nov 2026 14:25:53 +0000
Received: from out-86.mta0.migadu.com ([2001:41d0:1004:224b::56] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPYk-0000000FFRc-27jB
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 14:25:52 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=q7Ufw1jCvjg966DPgIa870eJgToNjk1qUAVnHeWMfXI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795184748; v=1; x=1795789548;
 b=DjfmR+rCa5wJ0P+uomdmUFlEDrsTORQQ2zlVPofP3VbyCsJ3bD5K/Ehoy30zEQQn2ZxDg7/w
 s18zHFnWD3g8VCaBlDQWtWwclvBV/d5l07VsffYTRUdKwm48Fc7lfkT1Sk97xpZN51klvMu4ekt
 pWdmYyB8jPs87MKhwrKrvrKA=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ba6f99fb7faf8c1a;
	Fri, 20 Nov 2026 14:25:39 +0000
X-Mizu-Trace-ID: ba6f99fb7faf8c1a
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 15:25:04 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Sainath Grandhi <sainathg@systemssoftware.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH] riscv: Add Zicboz CBO.ZERO tests
Message-ID: <awBVmzOuEuBFSnqX@orel>
References: <20260808055040.2093-1-sainathg@systemssoftware.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260808055040.2093-1-sainathg@systemssoftware.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_062551_452861_ABB7B6AB 
X-CRM114-Status: GOOD (  30.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sainath,

Thank you for submitting a riscv kvm-unit-tests test. The code is clean
and matches the commit message, but I'm not sure I see the motivation for
it. Do you plan to use k-u-t for ISA testing and this is a first? Or was
there a problem with zicboz and you used this to help debug it? Also,
I'm not sure we want to get into the business of testing the DT, so
you should probably have asserts for anywhere you currently have
report_fail's for unexpected DT check results.

Thanks,
drew

On Sat, Aug 08, 2026 at 05:50:40AM +0000, Sainath Grandhi wrote:
> Add a test for CBO.ZERO when Zicboz is advertised. Read the cache-block
> size from riscv,cboz-block-size and allocate three aligned blocks.
> Execute CBO.ZERO at multiple offsets in the middle block and verify that
> the containing block is zeroed while the adjacent blocks remain
> unchanged.
> 
> Skip the test when Zicboz is unavailable.
> 
> Signed-off-by: Sainath Grandhi <sainathg@systemssoftware.dev>
> ---
>  riscv/Makefile      |   1 +
>  riscv/isa-zicboz.c  | 168 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/unittests.cfg |   4 ++
>  3 files changed, 173 insertions(+)
>  create mode 100644 riscv/isa-zicboz.c
> 
> diff --git a/riscv/Makefile b/riscv/Makefile
> index 348a30a7..f4a97575 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -15,6 +15,7 @@ tests += $(TEST_DIR)/sbi.$(exe)
>  tests += $(TEST_DIR)/selftest.$(exe)
>  tests += $(TEST_DIR)/sieve.$(exe)
>  tests += $(TEST_DIR)/isa-dbltrp.$(exe)
> +tests += $(TEST_DIR)/isa-zicboz.$(exe)
>  
>  all: $(tests)
>  
> diff --git a/riscv/isa-zicboz.c b/riscv/isa-zicboz.c
> new file mode 100644
> index 00000000..76a2d209
> --- /dev/null
> +++ b/riscv/isa-zicboz.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Zicboz cache-block-zero instruction tests
> + *
> + * Copyright (C) 2026, Sainath Grandhi <sainathg@systemssoftware.dev>
> + */
> +#include <alloc.h>
> +#include <devicetree.h>
> +#include <libcflat.h>
> +#include <string.h>
> +
> +#include <asm/isa.h>
> +#include <asm/processor.h>
> +
> +#define GUARD_BEFORE_PATTERN	0xa5
> +#define TARGET_PATTERN		0x5a
> +#define GUARD_AFTER_PATTERN	0x3c
> +
> +struct zicboz_info {
> +	u64 hartid;
> +	u32 block_size;
> +	int property_len;
> +	bool found;
> +};
> +
> +static void find_zicboz_block_size(int cpu_node, u64 hartid, void *data)
> +{
> +	struct zicboz_info *info = data;
> +	const fdt32_t *property;
> +	int len;
> +
> +	if (hartid != info->hartid)
> +		return;
> +
> +	property = fdt_getprop(dt_fdt(), cpu_node,
> +			       "riscv,cboz-block-size", &len);

Please use all 100 allowed chars for line length. And same comment throughout.

> +	if (!property)
> +		return;
> +
> +	info->found = true;
> +	info->property_len = len;
> +	if (len == sizeof(*property))
> +		info->block_size = fdt32_to_cpu(*property);
> +}
> +
> +static bool get_zicboz_block_size(size_t *block_size)
> +{
> +	struct zicboz_info info = {
> +		.hartid = current_thread_info()->hartid,
> +	};
> +	int ret;
> +
> +	ret = dt_for_each_cpu_node(find_zicboz_block_size, &info);
> +	if (ret) {
> +		report_fail("failed to walk CPU nodes: %s", fdt_strerror(ret));
> +		return false;
> +	}
> +
> +	if (!info.found) {
> +		report_fail("riscv,cboz-block-size is missing");
> +		return false;
> +	}
> +
> +	if (info.property_len != sizeof(fdt32_t)) {
> +		report_fail("riscv,cboz-block-size has invalid length %d",
> +			    info.property_len);
> +		return false;
> +	}
> +
> +	if (!is_power_of_2(info.block_size)) {
> +		report_fail("invalid CBO.ZERO block size %u", info.block_size);
> +		return false;
> +	}
> +
> +	*block_size = info.block_size;
> +	return true;
> +}
> +
> +static inline void cbo_zero(void *address)
> +{
> +	asm volatile(".option push\n"
> +		".option arch, +zicboz\n"
> +		"cbo.zero 0(%0)\n"
> +		".option pop\n"
> +		:
> +		: "r" (address)
> +		: "memory");
> +}
> +
> +static bool block_has_value(const u8 *block, size_t block_size, u8 value)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < block_size; i++) {
> +		if (block[i] != value)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void test_cbo_zero_at_offset(u8 *area, size_t block_size,
> +				    size_t offset, const char *name)
> +{
> +	u8 *guard_before = area;
> +	u8 *target = guard_before + block_size;
> +	u8 *guard_after = target + block_size;
> +
> +	report_prefix_push(name);
> +
> +	memset(guard_before, GUARD_BEFORE_PATTERN, block_size);
> +	memset(target, TARGET_PATTERN, block_size);
> +	memset(guard_after, GUARD_AFTER_PATTERN, block_size);
> +
> +	cbo_zero(target + offset);
> +	asm volatile("fence rw, rw" ::: "memory");

smp_mb()

> +
> +	report(block_has_value(target, block_size, 0),
> +	       "target block was zeroed");
> +	report(block_has_value(guard_before, block_size,
> +			       GUARD_BEFORE_PATTERN),
> +	       "preceding block was preserved");
> +	report(block_has_value(guard_after, block_size,
> +			       GUARD_AFTER_PATTERN),
> +	       "following block was preserved");
> +
> +	report_prefix_pop();
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	size_t block_size;
> +	u8 *area;
> +
> +	report_prefix_push("zicboz");
> +
> +	if (!dt_available()) {
> +		report_skip("device tree is not available");
> +		goto out;
> +	}
> +
> +	if (!has_ext("zicboz")) {
> +		report_skip("Zicboz is not available");
> +		goto out;
> +	}
> +
> +	if (!get_zicboz_block_size(&block_size))
> +		goto out;
> +
> +	report_info("CBO.ZERO block size is %lu bytes",
> +		    (unsigned long)block_size);
> +
> +	area = memalign(block_size, 3 * block_size);
> +
> +	/* Every address within a block must select the same containing block. */
> +	test_cbo_zero_at_offset(area, block_size, 0, "block-start");
> +	test_cbo_zero_at_offset(area, block_size, 1, "second-byte");
> +	test_cbo_zero_at_offset(area, block_size, block_size / 2,
> +				"block-middle");
> +	test_cbo_zero_at_offset(area, block_size, block_size - 1,
> +				"block-end");
> +
> +	free(area);
> +
> +out:
> +	report_prefix_pop();
> +	return report_summary();
> +}
> diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
> index 9e9f58d9..30594fe5 100644
> --- a/riscv/unittests.cfg
> +++ b/riscv/unittests.cfg
> @@ -22,3 +22,7 @@ groups = sbi
>  [dbltrp]
>  file = isa-dbltrp.flat
>  groups = isa sbi
> +
> +[zicboz]
> +file = isa-zicboz.flat
> +groups = isa
> -- 
> 2.53.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
