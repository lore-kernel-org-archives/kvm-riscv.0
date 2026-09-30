Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C333DCA5FBE
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIXK5Z+yuxZDzajnn4+xgNKmS/mUr9sN/c2Ngrwk6Yk=; b=KJUhfmhSoYn6tX
	HOtAnaBXm4Q/UkV6Qlq09yGhtT+tSXaC7mgKXroHByV87j6Qxj+z76Fd8R0R1nsFg0g2hU051WaQY
	q9RxnkJ+hSPzm7fzuOeyeoQSZYFrc3t4D2W/ENuyXdW4mBFXcDTZ9veifgaOAyzWQZhKDLZFIPSH1
	zl5QO2iwzCNO9i9Avq5N8B9H2BoIigGBiWTt6DwqoLF/IsXuOlElYbGKyZPh4WFfbFlYqJtCon2oM
	bKEMY3Cji8lHahjOsRINxCms+V4sAtV2U7dmOEqVjGxzJyRJs3e2R0SLYQPbXvyxau7szd5HdJpk2
	lVJIryQMA0Ah7gw6eG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrLU-00000005hcR-1AWu;
	Wed, 30 Sep 2026 10:15:28 +0000
Received: from out-49.mta0.migadu.com ([2001:41d0:1004:224b::31] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrLK-00000005hWx-21he
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 10:15:20 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=RkoJMjZHl4KBOU2SB7z3AE78J0AfcJkGV0pZkQsN8og=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790763316; v=1; x=1791368116;
 b=C7Cc3vNYBCN+4o4hJzJ5K4iZ5h38qF6aQXIJ4ykC1iZryRvwlUX4QI/F6Y+oN4zhByqPbHEw
 DAEG2P4HxraKSOMeETbfBgaG9SAGyY5g5HHtCxT2wnQWNgN1BOqBG1V51G3kpzoOtsPwOAKc0Vx
 HNI59P2yNoFPkU6xxVrwiho8=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6792861cd6e12caf;
	Wed, 30 Sep 2026 10:15:15 +0000
X-Mizu-Trace-ID: 6792861cd6e12caf
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 12:15:10 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH 4/7] riscv: Add ACPI support for ISA
 string discovery
Message-ID: <it2vpvd5lo7rats2r6dbbtxyb4n4n5zwextkteccognilhzudj@7c5exktlyrr3>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
 <20260924033945.176581-5-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924033945.176581-5-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_031518_690347_15EB0EF8 
X-CRM114-Status: GOOD (  23.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24, 2026 at 11:39:42AM +0800, Xiang W wrote:
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
>  lib/acpi.h      | 28 ++++++++++++++++++++
>  lib/riscv/isa.c | 68 ++++++++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 89 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/acpi.h b/lib/acpi.h
> index 2597e8ce..3db382b7 100644
> --- a/lib/acpi.h
> +++ b/lib/acpi.h
> @@ -337,6 +337,34 @@ struct acpi_table_rhct {
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
> +	RHCT_NODE_ISA_STRING = 0x0,
> +	RHCT_NODE_HART_INFO = 0xFFFF

ACPI_RHCT_NODE_TYPE_ISA_STRING
ACPI_RHCT_NODE_TYPE_HART_INFO

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
> index bc1c9c72..b0257979 100644
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
> @@ -83,32 +83,80 @@ static void isa_parse_fdt(int cpu_node, u64 hartid, void *data)
>  	isa_parse(prop->data, len, info);
>  }
>  
> -static void isa_init_acpi(void)
> +#ifdef CONFIG_EFI
> +#include <acpi.h>
> +
> +static void isa_parse_acpi(struct acpi_table_rhct *rhct, struct acpi_rhct_node_hart_info *hart_info, void *data)

Let's keep it under 100

static void isa_parse_acpi(struct acpi_table_rhct *rhct,
			   struct acpi_rhct_node_hart_info *hart_info, void *data)

> +{
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
> +		if (node->type == RHCT_NODE_ISA_STRING) {
> +			isa_string = (void *) node;

 isa_string = (void *)node

I thought checkpatch would catch something like that. Did you run it?

> +			isa_parse(isa_string->isa, isa_string->isa_length, info);
> +		}
> +	}
> +}
> +
> +static void acpi_rhct_for_each_hart(
> +	void (*func)(struct acpi_table_rhct *, struct acpi_rhct_node_hart_info *, void *), void *data)

static void acpi_rhct_for_each_hart(void (*func)(struct acpi_table_rhct *,
						 struct acpi_rhct_node_hart_info *,
						 void *), void *data)

>  {
> -	assert_msg(false, "ACPI not available");
> +	u32 offset;
> +	struct acpi_table_rhct *rhct;
> +	struct acpi_rhct_node *node;
> +	struct acpi_rhct_node_hart_info *hart_info;

Need a blank line here. I'm thinking checkpatch wasn't run, since I'm sure
that would have been caught.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
