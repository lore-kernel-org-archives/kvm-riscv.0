Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713DEC02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBzW0C3w4YWLCsqjcWBgAvc5SsXAqGtqi5qxbMeFt1w=; b=aqNIIyzR5cFTm/
	sB8qZAZhfPb3mVeXoILCx9xNX9ojPgr+yjxEsEbDnlPNcLA05zUFy2+K10I5xkRvZKX9cKiPW6AJm
	zMWDLzFt7e1IsF036pvJTQSaazMWR6/xurN1Ur0W5Tin+U76P+nlHMqz2PTaB8wJOomIuOmtzvzC7
	qxQ/TDqfdL7tenG3Q8/XI2GgjcLumM7nIJ7lAjVMQbZOmgFa8mpsK1Ig9ju1vKKiXSjyFh5tUnzRD
	5SDvsJmG0C/Y97fsUP/z3Z46naTPQ62guhVKoevd4wQoHSNWN6FGn7vcobDFBeQFdOMO0uD3ZZkcA
	k/eweLr6HcEdrDfD4BLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2Ar-0000000BnbM-0iPB;
	Wed, 15 Jan 2025 12:07:05 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2Ao-0000000BnaH-0Lck
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 12:07:03 +0000
Date: Wed, 15 Jan 2025 13:06:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736942819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgbdkOgeyzusvyB+fsODM0Lt17XNh/jVvw1SWNs3Ews=;
	b=Cm03brpPU/LBmoQmOIqyEP6Vq6uSpPAh79322F1zgs82gwppERqu5mp858ZQhwHrsspdwj
	7FVoX2tYKDh/6ixmcg/6dfesVeumHSIl3TwaduIXNSDBi4dUuTzEWyhEkiuK6dqOL2VghI
	kWxH6fZ7w1CqhKToOOGjbLlUyLOOr0c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v6 4/5] riscv: lib: Add SBI SSE extension
 definitions
Message-ID: <20250115-ce8e8a312ade5e6c362d514d@orel>
References: <20250110111247.2963146-1-cleger@rivosinc.com>
 <20250110111247.2963146-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110111247.2963146-5-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_040702_617187_BA446A1F 
X-CRM114-Status: GOOD (  11.81  )
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

On Fri, Jan 10, 2025 at 12:12:43PM +0100, Cl=E9ment L=E9ger wrote:
> Add SBI SSE extension definitions in sbi.h
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 89 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> =

> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 98a9b097..83bdfb82 100644
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

We need SBI_ERR_DENIED_LOCKED too, but I guess that can be added with the
FWFT extension.

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
> @@ -71,6 +77,89 @@ enum sbi_ext_dbcn_fid {
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
> +#define SBI_SSE_ATTR_CONFIG_ONESHOT		BIT(0)
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
> +/* Range 0x00000000 - 0x0000ffff */
> +#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
> +#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
> +#define SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
> +
> +#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x0000c000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_0_END		0x0000ffff
> +
> +/* Range 0x00010000 - 0x0001ffff */
> +#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_1_START	0x00014000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_1_END		0x00017fff
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_1_START	0x0001c000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_1_END		0x0001ffff
> +
> +/* Range 0x00100000 - 0x0010ffff */
> +#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_2_START	0x00104000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_2_END		0x00107fff
> +#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_2_START	0x0010c000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_2_END		0x0010ffff
> +
> +/* Range 0xffff0000 - 0xffffffff */
> +#define SBI_SSE_EVENT_LOCAL_SOFTWARE		0xffff0000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_3_START	0xffff4000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_3_END		0xffff7fff
> +#define SBI_SSE_EVENT_GLOBAL_SOFTWARE		0xffff8000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_3_START	0xffffc000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_3_END		0xffffffff
> +
> +#define SBI_SSE_EVENT_PLATFORM_BIT		BIT(14)
> +#define SBI_SSE_EVENT_GLOBAL_BIT		BIT(15)
> +
>  struct sbiret {
>  	long error;
>  	long value;
> -- =

> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
