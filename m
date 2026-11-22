Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF475606A320
	for <kvm-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GvkTL/4P;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YbGWDTbk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=16gxgNQTuNauLtEOdQ/T6rI/CB3rJODg9dgnUKJrynI=; b=GvkTL/4PwExmhAVLcISaVVCMpj
	eSVqwaRsYGwjUqK1Fe4k7QlDhFSaNaI2Svc8kbSJ+w6G128Vc2r8xltYXPMbW05EByzf0e77S9z7V
	OYAoqbGYaGqN5E6tLXmkLxAa9XP1I++zz8g6KJ60CstN7LyhCPbl/+d8BhFnRrlfytWR8ngIHWCuj
	CwCp7kvvqhXXnlEcHNBMI6V3ljr++xG+kCghFk5ufmWtYJaNazc8N9DH9bH493cofiIFq6kWt1LSC
	fggmZOLSEqWTNJ9TfoIxX2VVFxzvz4zILt1xK1KBBSv75F50bxp7lE8UHjTaOMPfRFzJ46FzB1Rdk
	hFiPmnhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6DN-000000013e0-1hsX;
	Sun, 22 Nov 2026 11:58:37 +0000
Received: from out-167.mta1.migadu.com ([2001:41d0:203:375::a7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6DJ-000000013d9-1e0F
	for kvm-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 11:58:35 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GX6LAbg/e50bucZW+XNw4XX6G67RFU3kH3Pv9OsHvu0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795348709; v=1; x=1795953509;
 b=YbGWDTbkOCijWwbs3t5GPdmyVv24aG8wNGRrCs/EWCGkMHD9ExPWZNOo1M0yQIJrfzx6CWsi
 zJ1xryC8AJlrIOLB1MOx7AKos1sVB+Zg+dFrj9gWfN1oGv96Jm7Q2V8UwRPNiK8QEB1zL96mqwL
 svEtjP65v4bR7X0jdgo1HXjg=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e1cc464e81a4892c;
	Sun, 22 Nov 2026 11:58:29 +0000
X-Mizu-Trace-ID: e1cc464e81a4892c
X-Migadu-Flow: FLOW_OUT
Date: Sun, 22 Nov 2026 12:57:54 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Koichiro Den <den@valinux.co.jp>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bingyu Xian <shanbeeyoo@gmail.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] RISC-V: KVM: Order writes to the SBI STA shared
 structure
Message-ID: <awLYsnfgGQqNnL7q@orel>
References: <20261121173526.892344-1-den@valinux.co.jp>
 <20261121173526.892344-2-den@valinux.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261121173526.892344-2-den@valinux.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_035833_936534_79C2DBE0 
X-CRM114-Status: GOOD (  10.40  )
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

On Sun, Nov 22, 2026 at 02:35:24AM +0900, Koichiro Den wrote:
> The guest checks the sequence before and after reading steal time. If
> the final even sequence becomes visible before the updated steal time,
> the guest can accept a stale value. CSR accesses are weakly ordered;
> toggling sstatus.SUM in get_user() and put_user() does not guarantee
> that the guest observes those stores in order.
> 
> Pair the read barriers in pv_time_steal_clock() with write barriers.
> 
> Fixes: e9f12b5fff8a ("RISC-V: KVM: Implement SBI STA extension")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes since v1:
>   - New patch. Split the write barriers out of v1 patch #1 into a
>     separate fix. (Andrew)
> 
>  arch/riscv/kvm/vcpu_sbi_sta.c | 5 +++++
>  1 file changed, 5 insertions(+)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
