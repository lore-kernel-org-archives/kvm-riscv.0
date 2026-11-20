Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A459606A320
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JuMp8M+6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ikExANiX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oIoVXwaOvMutvLxNZD66jCx1vSn3F3nvt3QrVFRpYiU=; b=JuMp8M+6OYSJMMUdtewSl00t/D
	cwPa2SticSK1if3Eev+/8/exAMdsn1V/obJeU+NNfN081RaNBGLc03djUIL+/ZXrBZkx7XIezWoXa
	aCyh8Lenbs2MRllVvMP6Wrcg5LWxwniLZaxHU+ngb1JjgGeC+jQBHgjnjm6Bo8snrmzQ4KstaVZTV
	+ET+9inuGVjVt89OBon6LLCxRTH4pVkdCis9Rzuf2bR+DXDkKacaSmKA1aGpbPtx1QwWFC9tni1aa
	hStxherjfaXckMvz8krY9rkkrFUH7pstYyKFOXR1EoJ11E2rRB5sY0ly/NWXrZk+/mKhuOhvmgkRY
	bKHDAilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKP8-0000000EP2K-2711;
	Fri, 20 Nov 2026 08:55:35 +0000
Received: from out-11.mta0.migadu.com ([2001:41d0:1004:224b::b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKP2-0000000EP0s-4BCw
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 08:55:33 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AMQp0GfzBfokKPQdG0ah10319ae3QMcosZHAYVir9mo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795164924; v=1; x=1795769724;
 b=ikExANiXN/B+x4+FxyrSLabyg23OvWnuS/33nD0aE/tbE/S4UEvBM2/cDFskh+mqu8q7cpXG
 CeikZqy4+6u5whMN2p7K4YJmgSXLqJPgzbBHQaEvK8PmUrjE27sSUgse02DClDb0DIEg/oyDLKk
 vY1xiMh9rgZO9avCo+5DrFCI=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 53741bf653518542;
	Fri, 20 Nov 2026 08:55:24 +0000
X-Mizu-Trace-ID: 53741bf653518542
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 09:54:49 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 4/8] riscv: Add ACPI support for ISA
 string discovery
Message-ID: <awAKq3jFCaVvxVA0@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-5-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105082035.133680-5-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_005529_560248_690635D7 
X-CRM114-Status: GOOD (  20.36  )
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

On Thu, Nov 05, 2026 at 04:20:31PM +0800, Xiang W wrote:
> When a DT is not provided, walk the RHCT Hart Info nodes and parse
> the referenced ISA String node instead of aborting in isa_init()
> and cpu_has_extension_name().
> 
> Match the current hart by ACPI UID (DT still matches by hartid)
> and feed the ISA string into the existing isa_parse() helper so
> extension detection is shared by both firmware descriptions.
> 
> Rename isa_info.hartid to isa_info.id so the same iterator state
> can hold either identifier.
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  lib/acpi.h      | 28 +++++++++++++++++
>  lib/riscv/isa.c | 81 ++++++++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 102 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/acpi.h b/lib/acpi.h
> index 0589669b..d5e238a9 100644
> --- a/lib/acpi.h
> +++ b/lib/acpi.h
> @@ -334,6 +334,34 @@ struct acpi_table_rhct {
>  	u32 node_offset;
>  };
>  
> +#define ACPI_RHCT_NODE_HEADER_DEF \
> +	u16 type;	\
> +	u16 length;	\
> +	u16 revision;	\
> +
> +struct acpi_rhct_node {
> +	ACPI_RHCT_NODE_HEADER_DEF
> +	char data[];
> +};
> +
> +enum acpi_rhct_node_type {
> +	ACPI_RHCT_NODE_TYPE_ISA_STRING = 0x0,
> +	ACPI_RHCT_NODE_TYPE_HART_INFO = 0xFFFF
> +};
> +
> +struct acpi_rhct_node_isa_string {
> +	ACPI_RHCT_NODE_HEADER_DEF
> +	u16 isa_length;
> +	char isa[];
> +};
> +
> +struct acpi_rhct_node_hart_info {
> +	ACPI_RHCT_NODE_HEADER_DEF
> +	u16 num_offsets;
> +	u32 uid;
> +	u32 nodes[];
> +};
> +
>  /* Reset to default packing */
>  #pragma pack()
>  
> diff --git a/lib/riscv/isa.c b/lib/riscv/isa.c
> index bc1c9c72..91c7302c 100644
> --- a/lib/riscv/isa.c
> +++ b/lib/riscv/isa.c
> @@ -12,7 +12,7 @@
>  typedef void (*isa_func_t)(const char *, int, void *);
>  
>  struct isa_info {
> -	unsigned long hartid;
> +	unsigned long id;
>  	isa_func_t func;
>  	void *data;
>  };
> @@ -74,7 +74,7 @@ static void isa_parse_fdt(int cpu_node, u64 hartid, void *data)
>  	const struct fdt_property *prop;
>  	int len;
>  
> -	if (hartid != info->hartid)
> +	if (hartid != info->id)
>  		return;
>  
>  	prop = fdt_get_property(dt_fdt(), cpu_node, "riscv,isa", &len);
> @@ -83,32 +83,92 @@ static void isa_parse_fdt(int cpu_node, u64 hartid, void *data)
>  	isa_parse(prop->data, len, info);
>  }
>  
> -static void isa_init_acpi(void)
> +#ifdef CONFIG_EFI
> +#include <acpi.h>
> +
> +static void isa_parse_acpi(struct acpi_table_rhct *rhct,
> +			   struct acpi_rhct_node_hart_info *hart_info, void *data)
>  {
> -	assert_msg(false, "ACPI not available");
> +	u32 offset;
> +	struct acpi_rhct_node *node;
> +	struct acpi_rhct_node_isa_string *isa_string;
> +	struct isa_info *info = (struct isa_info *)data;
> +
> +	if (hart_info->uid != info->id)
> +		return;
> +
> +	for (int i = 0; i < hart_info->num_offsets; i++) {
> +		offset = hart_info->nodes[i];
> +		if (offset >= rhct->length)
> +			break;
> +		node = (void *)rhct + offset;
> +		if (node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
> +			isa_string = (void *) node;

(void *)node

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
