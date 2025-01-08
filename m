Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA14E77188
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIluXXFIX+wepCK1TiKSi94EIyeUTQ8PENdhjSGactY=; b=Ss3+16ZcZHunuj
	pJfLqHWQs4JnJyYBtLkJoXTkXmVR7fHQFQn90srJ76DzRsU8lUeZNFPTV0ozi9rC0WVAicOo/bNM2
	M8gzijL7CygtJTXsN11GK/wn8dj8APSZK5wt/e2YC1mBoj9k/+OGFgxOzaDRxSfmnvP48KyAXV1n0
	DGPmXML0PA9rxQCAFYVls74Z8s6TeZBHmYuOO02M5RL18Kq3sFI/XzsAQusnKHvlUocphmy5npQ2Y
	+pFQzkciBtzyrl8Ma6WjW9TxvEFnk+5aq7IDTguTkVJsP5wV2vF2lPKDwxIWsNEun87JPyhXtXpuc
	G2Au1/cWqWj3299jLEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVzQ-00000008apr-2kQF;
	Wed, 08 Jan 2025 13:20:52 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVic-00000008XGa-0SgD
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 13:03:31 +0000
Date: Wed, 8 Jan 2025 14:03:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736341407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/uqjgTJv39fxY5Kjsx2QGRWfI206q33hQLFzQUJTbc=;
	b=wDRxyQh1XPzEL8dPJ83p/8jCs4uAr3IiYRAfeDTY7Z24KQoIrYbK+NoWqBjW69LEvcN9kz
	XKJgcvyPOf+uynNUNwIMLrbkXlHpDuaJToD/o4lotF+zi93XliV1OZoDFUzELGrQBzuVhp
	rabbskhD6g9fy/Y+3Bo69FJlCR0b1a8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v4 4/5] riscv: lib: Add SBI SSE extension
 definitions
Message-ID: <20250108-522f238cc21ce59e16134c79@orel>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
 <20241125162200.1630845-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241125162200.1630845-5-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_050330_435667_3D3214AB 
X-CRM114-Status: GOOD (  13.19  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 25, 2024 at 05:21:53PM +0100, Cl=E9ment L=E9ger wrote:
> Add SBI SSE extension definitions in sbi.h
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 83 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> =

> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 98a9b097..a751d0c3 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -11,6 +11,11 @@
>  #define SBI_ERR_ALREADY_AVAILABLE	-6
>  #define SBI_ERR_ALREADY_STARTED		-7
>  #define SBI_ERR_ALREADY_STOPPED		-8
> +#define SBI_ERR_NO_SHMEM		-9
> +#define SBI_ERR_INVALID_STATE		-10
> +#define SBI_ERR_BAD_RANGE		-11
> +#define SBI_ERR_TIMEOUT			-12
> +#define SBI_ERR_IO			-13
>  =

>  #ifndef __ASSEMBLY__
>  #include <cpumask.h>
> @@ -23,6 +28,7 @@ enum sbi_ext_id {
>  	SBI_EXT_SRST =3D 0x53525354,
>  	SBI_EXT_DBCN =3D 0x4442434E,
>  	SBI_EXT_SUSP =3D 0x53555350,
> +	SBI_EXT_SSE =3D 0x535345,
>  };
>  =

>  enum sbi_ext_base_fid {
> @@ -71,6 +77,83 @@ enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
>  };
>  =

> +enum sbi_ext_sse_fid {
> +	SBI_EXT_SSE_READ_ATTRS =3D 0,
> +	SBI_EXT_SSE_WRITE_ATTRS,
> +	SBI_EXT_SSE_REGISTER,
> +	SBI_EXT_SSE_UNREGISTER,
> +	SBI_EXT_SSE_ENABLE,
> +	SBI_EXT_SSE_DISABLE,
> +	SBI_EXT_SSE_COMPLETE,
> +	SBI_EXT_SSE_INJECT,
> +	SBI_EXT_SSE_HART_UNMASK,
> +	SBI_EXT_SSE_HART_MASK,
> +};
> +
> +/* SBI SSE Event Attributes. */
> +enum sbi_sse_attr_id {
> +	SBI_SSE_ATTR_STATUS		=3D 0x00000000,
> +	SBI_SSE_ATTR_PRIORITY		=3D 0x00000001,
> +	SBI_SSE_ATTR_CONFIG		=3D 0x00000002,
> +	SBI_SSE_ATTR_PREFERRED_HART	=3D 0x00000003,
> +	SBI_SSE_ATTR_ENTRY_PC		=3D 0x00000004,
> +	SBI_SSE_ATTR_ENTRY_ARG		=3D 0x00000005,
> +	SBI_SSE_ATTR_INTERRUPTED_SEPC	=3D 0x00000006,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS	=3D 0x00000007,
> +	SBI_SSE_ATTR_INTERRUPTED_A6	=3D 0x00000008,
> +	SBI_SSE_ATTR_INTERRUPTED_A7	=3D 0x00000009,
> +};
> +
> +#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
> +#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
> +#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
> +#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
> +
> +#define SBI_SSE_ATTR_CONFIG_ONESHOT	(1 << 0)

BIT(0)

> +
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
> +
> +enum sbi_sse_state {
> +	SBI_SSE_STATE_UNUSED		=3D 0,
> +	SBI_SSE_STATE_REGISTERED	=3D 1,
> +	SBI_SSE_STATE_ENABLED		=3D 2,
> +	SBI_SSE_STATE_RUNNING		=3D 3,
> +};
> +
> +/* SBI SSE Event IDs. */
> +#define SBI_SSE_EVENT_LOCAL_RAS			0x00000000
> +#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
> +#define SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
> +
> +#define SBI_SSE_EVENT_GLOBAL_RAS		0x00008000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x0000c000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_0_END		0x0000ffff
> +
> +#define SBI_SSE_EVENT_LOCAL_PMU			0x00010000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_1_START	0x00014000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_1_END		0x00017fff
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_1_START	0x0001c000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_1_END		0x0001ffff
> +
> +#define SBI_SSE_EVENT_LOCAL_PLAT_2_START	0x00024000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_2_END		0x00027fff
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_2_START	0x0002c000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_2_END		0x0002ffff

The above four don't appear to be in the spec anymore.

> +
> +#define SBI_SSE_EVENT_LOCAL_SOFTWARE		0xffff0000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_3_START	0xffff4000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_3_END		0xffff7fff
> +#define SBI_SSE_EVENT_GLOBAL_SOFTWARE		0xffff8000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_3_START	0xffffc000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_3_END		0xffffffff
> +
> +#define SBI_SSE_EVENT_PLATFORM_BIT		(1 << 14)
> +#define SBI_SSE_EVENT_GLOBAL_BIT		(1 << 15)

BIT(14)
BIT(15)

I think other changes are coming to these event IDs from a series Atish
recently posted too.

> +
>  struct sbiret {
>  	long error;
>  	long value;
> -- =

> 2.45.2
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
