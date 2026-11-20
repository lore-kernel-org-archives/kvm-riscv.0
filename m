Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB4B60A260C
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vVkqN60L;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d22FHTaa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o3KDFcBqFyo1f00Jf8NJiRcBpMRY7VtvMtF6xIr30Mw=; b=vVkqN60LOhfyLXp98U/58T/t+2
	c3kA+JPL/VpDRvIi1nH6diVKqXhH2diMds3uqaVY2s8pd832fIuRXbmuRGUNjKvzI8RQ7KU40tXSG
	CJQfVCFzAcXtckOxTrZrXyMDCwlSdXRhpocmQ99fp8vP8kwj0MsVgx58evAnkYUKu/f252CU4mXV+
	6wG9Q53h7/nvCnYR8HmQIweVNh7S6iHbPk5eEohZrDvIKHYc6buNlD/6gB3IpS4ZxVp9JRDgnI77r
	fw1wwz9WzZwLhv981gBJTkEKpcFNirvyERz4sHr2vTK4+UphLF6i0sGIcphy7KW1yz0QOQN0Oz/m3
	dPMmQr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP07-0000000FB2c-1Rl5;
	Fri, 20 Nov 2026 13:50:03 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP04-0000000FB1F-18mL
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 13:50:02 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mseadl3+prfV3Njbj2odlN7ph9bWDdh3UmBz/VyOYco=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795182597; v=1; x=1795787397;
 b=d22FHTaaGQa1/D4Q5Ht21DMci3OqGuuFl6t6pWV49ADz5XmOJ91DRc7uAbaqGKWvJq6ubBIO
 6KTGDYiwk4WD6oaEKWqqAijDfLFzBInGDz6jpU4eTn8AVWchD6gFayg+oU1y8M7oSuAR6BHjc6y
 kbvLQh+ikLKMa3Mp387ZtDqE=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 60c44ff64fed04d7;
	Fri, 20 Nov 2026 13:49:57 +0000
X-Mizu-Trace-ID: 60c44ff64fed04d7
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 14:49:26 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 7/8] riscv: initialize ISA extensions
 for all harts in cpu_init
Message-ID: <awBPzACbLy95U5yE@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-8-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105082035.133680-8-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_055001_368003_65FC51D1 
X-CRM114-Status: GOOD (  16.07  )
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

"initialize" should be capitalized in the patch summary.

On Thu, Nov 05, 2026 at 04:20:34PM +0800, Xiang W wrote:
> Move `isa_init()` from `thread_info_init()` to `cpu_init()`.
> 
> Previously it only ran for the current hart; now it is called for every
> hart so that ISA extensions are parsed for the whole system.
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  lib/riscv/processor.c | 1 -
>  lib/riscv/setup.c     | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/riscv/processor.c b/lib/riscv/processor.c
> index b055acc9..ddecc25e 100644
> --- a/lib/riscv/processor.c
> +++ b/lib/riscv/processor.c
> @@ -81,7 +81,6 @@ void thread_info_init(void)
>  	unsigned long hartid = csr_read(CSR_SSCRATCH);
>  	int cpu = hartid_to_cpu(hartid);
>  
> -	isa_init(&cpus[cpu]);
>  	csr_write(CSR_SSCRATCH, &cpus[cpu]);
>  }
>  
> diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
> index f1121573..8c16686f 100644
> --- a/lib/riscv/setup.c
> +++ b/lib/riscv/setup.c
> @@ -16,6 +16,7 @@
>  #include <on-cpus.h>
>  #include <vmalloc.h>
>  #include <asm/csr.h>
> +#include <asm/isa.h>
>  #include <asm/mmu.h>
>  #include <asm/page.h>
>  #include <asm/processor.h>
> @@ -105,6 +106,9 @@ static void cpu_init(void)
>  		cpu_init_acpi();
>  	}
>  
> +	for (int cpu = 0; cpu < nr_cpus; cpu++)
> +		isa_init(&cpus[cpu]);
> +
>  	me = hartid_to_cpu(csr_read(CSR_SSCRATCH));
>  	assert(cpu_present(me));
>  	set_cpu_online(me, true);
> -- 
> 2.47.3
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
