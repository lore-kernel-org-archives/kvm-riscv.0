Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE9606A320
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 09:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bgtd/i1C;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IP3LqZIQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rHQTZ3jCyBhDGQpVs5/SUxSABQF983Q38TdrHZphzA4=; b=bgtd/i1CjaizR8d3apU26DnMwJ
	QtgV0KfGMdGYgoJnYwN75lhdMz91aQttMMoI2mIrUoZWCHzgrYFwpQGw2NrdHBpyx1RJz0Udttk6b
	sKeyBqOwVXqZ3Q4HKqpo/+SUu/g/C8Gf/tb6kaXGb7h70QxV28rq0+LU0Q2F+Qwx1xK90Zz6ckply
	WEbNrQ5RuLsVq78hc+VzvewbO3uTP8F+Y2gavO8ota9lzXJxR40GrWTUfYiRCRuPcZwtHm9j3azYI
	Z7teE5MngFBFOnuyn/oUdba32l2OUXT/A+v8rxf1xegJBIazm/Y2+ijemXCby+dKdLFVsJbTglC/3
	I0Y55eJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKhu-0000000ER6Z-3Ljy;
	Fri, 20 Nov 2026 09:14:58 +0000
Received: from out-16.mta0.migadu.com ([2001:41d0:1004:224b::10] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKhj-0000000ER62-0QSA
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 09:14:57 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uRITAmfSiSUdZSBQ2vzurT5jha/a7G3BdG1Vu73+siU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795166085; v=1; x=1795770885;
 b=IP3LqZIQFet7yFL1AEDFOL8PjNnd7keZwe49KIrdK3nQvpmxtfYr3AdAJN98EDl5A6TJXaTE
 k8O7o1Wt5Yj4/tImSGhqVQayuzxfPQkvmPaY54x8E71Q5RvuSOUqHZaDqNxU2PS7+lDaMVRsNIq
 Yxia9NSyT4PjPASK6PTJhzPo=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cf8e84fe6a0cfa9f;
	Fri, 20 Nov 2026 09:14:45 +0000
X-Mizu-Trace-ID: cf8e84fe6a0cfa9f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 10:14:13 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 4/8] riscv: Add ACPI support for ISA
 string discovery
Message-ID: <awAMfrnZbDemHE8o@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-5-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105082035.133680-5-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_011447_394885_A7DE1AA6 
X-CRM114-Status: GOOD (  13.30  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:20:31PM +0800, Xiang W wrote:
...
> +static int acpi_rhct_for_each_hart(void (*func)(struct acpi_table_rhct *,
> +						 struct acpi_rhct_node_hart_info *,
> +						 void *), void *data)

Check the alignment of these parameters. There's an extra space.

> +{
> +	u32 offset;
> +	struct acpi_table_rhct *rhct;
> +	struct acpi_rhct_node *node;
> +	struct acpi_rhct_node_hart_info *hart_info;
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
>  	} else {
> -		isa_init_acpi();
> +#ifdef CONFIG_EFI
> +		info.id = ti->uid;
> +		ret = acpi_rhct_for_each_hart(isa_parse_acpi, &info);
> +		assert(ret == 0);

assert_msg(ret == 0, "ACPI: Failed to parse RHCT");

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
>  	} else {
> +#ifdef CONFIG_EFI
> +		info.id = cpus[cpu].uid;
> +		ret = acpi_rhct_for_each_hart(isa_parse_acpi, &info);
> +		assert(ret == 0);

assert_msg(ret == 0, "ACPI: Failed to parse RHCT");

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
