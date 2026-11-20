Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B60C60A2607
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bj7U/RiV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dzenPEWc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8UGO1o/LZ+nr/GkiRd3R5s1oCSnZ/dZyHjEeQpizKLk=; b=Bj7U/RiVBlAnMbr1MDODOe12J0
	E3sfTdfafkTAZ5d26J80EtFUNfiwuyEha44nC3KCOYCvdS+llkyMHiohGJRKnzlthLruB5jbN31un
	XzyLg/KgxaLWiOI1XgeQFiO08yxOrx3o4AmU8I0iVlHRjf2/rInRbxSMzesaYbRpsKHz6HiiYILIs
	eNjdWglDYQT/m85mD5fluuo68GsAxlMm23I7KJjUtLLtR+/cA+5dIEMfz9c3IwCyfPfu7tiV673Wa
	uYXHEJwV9Nk15zomlklTWA6WJe/EoDbPU7+JdssbJ6v2LsvKHSNZHmtqxkmJ01QwlsEoYVXXfWNMu
	UCPP7RnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMws-0000000EpLr-3cEC;
	Fri, 20 Nov 2026 11:38:34 +0000
Received: from out-8.mta0.migadu.com ([2001:41d0:1004:224b::8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMwq-0000000EpJu-0hKF
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 11:38:33 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EED0LOn8kMLeT/0F0q+OLC6vYC9sgzoTZhYuEoPU/AE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795174710; v=1; x=1795779510;
 b=dzenPEWcVXrtN9/jbkhFVMou+n+LL4c5MAxuc5lWSIWRuNUPEqwb0CX+znyj8IwT4F30fK7L
 5Sh2co+8vCkt05dLBuwuwDub2lZDHvHqbQ0cmHCF43lJVDCXdXYXt1lwRy2jyZlZNSim0mQkEtE
 9xY8coem9Uj/i9lBzddZ/GXI=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 80c0f1bde74df4e5;
	Fri, 20 Nov 2026 11:38:29 +0000
X-Mizu-Trace-ID: 80c0f1bde74df4e5
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 12:37:59 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 7/8] riscv: initialize ISA extensions
 for all harts in cpu_init
Message-ID: <awAt95G5LR33UsLN@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-8-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105082035.133680-8-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_033832_418771_A94D727B 
X-CRM114-Status: GOOD (  13.62  )
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

On Thu, Nov 05, 2026 at 04:20:34PM +0800, Xiang W wrote:
> Move `isa_init()` from `thread_info_init()` to `cpu_init()`.
> 
> Previously it only ran for the current hart; now it is called for every
> hart so that ISA extensions are parsed for the whole system.

It was already run on every hart. The boot hart at boot time, the
secondaries at secondary start time. However, I see in the next patch
that you want to query ISA extensions on secondaries that haven't run
secondary start. Since we already initialize some thread info in cpu init
then I think it's reasonable to also init ISA there as you do, but let's
do it like in the following diff instead of anding the loop

diff --git a/lib/riscv/processor.c b/lib/riscv/processor.c
index b055acc94e41..ddecc25e940d 100644
--- a/lib/riscv/processor.c
+++ b/lib/riscv/processor.c
@@ -81,7 +81,6 @@ void thread_info_init(void)
 	unsigned long hartid = csr_read(CSR_SSCRATCH);
 	int cpu = hartid_to_cpu(hartid);
 
-	isa_init(&cpus[cpu]);
 	csr_write(CSR_SSCRATCH, &cpus[cpu]);
 }
 
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index f1121573e81c..547851f532c3 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -16,6 +16,7 @@
 #include <on-cpus.h>
 #include <vmalloc.h>
 #include <asm/csr.h>
+#include <asm/isa.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
 #include <asm/processor.h>
@@ -61,6 +62,7 @@ static int cpu_set_acpi(struct acpi_subtable_header *header)
 	cpus[cpu].cpu = cpu;
 	cpus[cpu].hartid = intc->hart_id;
 	cpus[cpu].uid = intc->uid;
+	isa_init(&cpus[cpu]);
 
 	if (intc->flags & ACPI_MADT_ENABLED) {
 		if (!sbi_hart_get_status(cpus[cpu].hartid).error)
@@ -79,6 +81,7 @@ static void cpu_set_fdt(int fdtnode __unused, u64 regval, void *info __unused)
 
 	cpus[cpu].cpu = cpu;
 	cpus[cpu].hartid = regval;
+	isa_init(&cpus[cpu]);
 
 	if (!sbi_hart_get_status(cpus[cpu].hartid).error)
 		set_cpu_present(cpu, true);

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
