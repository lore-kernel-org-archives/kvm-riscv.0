Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF4E606A325
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jQfDAVkK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hH29Jo7+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=76SlkIo+sQkEO0wOR0oD0o/MG6PDHILOBvsfZgw+JTY=; b=jQfDAVkKPdWnmNqCdAFNRalqI+
	lao+Ra8c08Y102/YoHp4KfXtYvlftqfnCBfc4iBF0rloaSJ5biUCQOPXneYb8PoaNYRzoj8LR+SNq
	dDgKqeHj63c46lB3Cfh268IBBebC739HY93Pn/+hWyEABHe3pAbJNFQNpb9QB8a84YNSpiq7WVXMK
	a+A/KhbM2vQ8x6pdSfEMPsyx3bJCbnrnMghtUUq57FnmHsPrX8UhKm/IIV/a5fiE9bkywwB6Q37FW
	EHTnqrYud9S1KbeBes8G3Yy1uI2pyFqNsug1TD96gj6vtiO2xBGJwrM9NB1kq++GS8WJfGxjLDDXc
	mHJTFfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMgX-0000000Em6n-1Bw3;
	Fri, 20 Nov 2026 11:21:42 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMgK-0000000Em5B-1cjN
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 11:21:39 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9n4cByJoPdB+kW90lGIyuXDMxhLTitfTJHK9dWQrb3I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795173685; v=1; x=1795778485;
 b=hH29Jo7+zJfKejZ41WbucKWE1dBqgxHKhh7TLXoqRSanLeHRul2hH1eS6mZkgPUCohTc7600
 zcfRMgk36oX0uUi2X9OfZ5HNRHpexnQUhkNdsX9RL81vcq4CKDRjLif1u/GL4UKw82lJpt3MRW0
 pqqu7kdY3E13JRV6TcwsAjWo=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d22eb9c66bf70ffc;
	Fri, 20 Nov 2026 11:21:25 +0000
X-Mizu-Trace-ID: d22eb9c66bf70ffc
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 12:20:50 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 4/8] riscv: Add ACPI support for ISA
 string discovery
Message-ID: <awAsCpi2bTlRh6lu@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-5-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105082035.133680-5-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_032128_972096_E9B8EC21 
X-CRM114-Status: GOOD (  25.67  )
X-Spam-Score: -2.8 (--)
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

nit: I prefer reverse fir tree

> +
> +	if (hart_info->uid != info->id)
> +		return;
> +
> +	for (int i = 0; i < hart_info->num_offsets; i++) {
> +		offset = hart_info->nodes[i];
> +		if (offset >= rhct->length)
> +			break;

Shouldn't this be an assert instead of a silent return?

> +		node = (void *)rhct + offset;
> +		if (node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
> +			isa_string = (void *) node;
> +			isa_parse(isa_string->isa, isa_string->isa_length, info);
> +		}
> +	}
> +}
> +
> +static int acpi_rhct_for_each_hart(void (*func)(struct acpi_table_rhct *,
> +						 struct acpi_rhct_node_hart_info *,
> +						 void *), void *data)
> +{
> +	u32 offset;
> +	struct acpi_table_rhct *rhct;
> +	struct acpi_rhct_node *node;
> +	struct acpi_rhct_node_hart_info *hart_info;

same fir tree nit (and likely elsewhere in the series)

> +
> +	rhct = find_acpi_table_addr(RHCT_SIGNATURE);
> +	if (rhct == NULL)
> +		return -1;
> +
> +	offset = rhct->node_offset;
> +	for (int i = 0; i < rhct->node_count; i++) {
> +		if (offset >= rhct->length)
> +			return -1;
> +
> +		node = (void *)rhct + offset;
> +		if (node->length < sizeof(*node))
> +			return -1;
> +
> +		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
> +			hart_info = (void *)node;
> +			func(rhct, hart_info, data);
> +		}
> +
> +		offset += node->length;
> +	}
> +
> +	return 0;
>  }
> +#endif
>  
>  void isa_init(struct thread_info *ti)
>  {
>  	struct isa_info info = {
> -		.hartid = ti->hartid,
>  		.func = isa_bit,
>  		.data = ti,
>  	};
>  	int ret;
>  
>  	if (dt_available()) {
> +		info.id = ti->hartid;
>  		ret = dt_for_each_cpu_node(isa_parse_fdt, &info);
>  		assert(ret == 0);

While touching this code you can add assert_msg here too like I suggested
for your asserts below in my other reply.

>  	} else {
> -		isa_init_acpi();
> +#ifdef CONFIG_EFI
> +		info.id = ti->uid;
> +		ret = acpi_rhct_for_each_hart(isa_parse_acpi, &info);
> +		assert(ret == 0);
> +#else
> +		assert_msg(false, "ACPI not available");
> +#endif
>  	}
>  }
>  
>  bool cpu_has_extension_name(int cpu, const char *ext)
>  {
>  	struct isa_info info = {
> -		.hartid = cpus[cpu].hartid,
>  		.func = isa_name,
>  		.data = &(struct isa_check){ .ext = ext, },
>  	};
> @@ -116,10 +176,17 @@ bool cpu_has_extension_name(int cpu, const char *ext)
>  	int ret;
>  
>  	if (dt_available()) {
> +		info.id = cpus[cpu].hartid;
>  		ret = dt_for_each_cpu_node(isa_parse_fdt, &info);
>  		assert(ret == 0);

and assert_msg here too, please

>  	} else {
> +#ifdef CONFIG_EFI
> +		info.id = cpus[cpu].uid;
> +		ret = acpi_rhct_for_each_hart(isa_parse_acpi, &info);
> +		assert(ret == 0);
> +#else
>  		assert_msg(false, "ACPI not available");
> +#endif
>  	}
>  
>  	return check->found;
> -- 
> 2.47.3
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
