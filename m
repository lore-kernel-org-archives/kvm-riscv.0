Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C033606A321
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=csGrgY5+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xmSI12ce
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tmuABdVLxHp/EbBSPsLU5WTBFkYWY3EiHaWVztuMfWs=; b=csGrgY5+norkNLEJkHWlveLlIM
	vtKWs9t2EwUH7fefyZbp+d58r6FEZSATRzizDb71ttCIjF7+k57YP0XoJEgoq2wsgIyIUJxzs2qaC
	9Gqwov6Go7D3SMgeEXBZQfJ3FErdQjvtqVwN3Q3/ST0UJkSS4LErLZsE2iGJyHg6H3wpe8qCxRlg4
	kOUlgxHNfLIleQgjrES0cwc7j/Acrgz7z2fUga8ccr/z1Epn+xrJmrg2OJjZ37OtFRRaK6YxPbsDe
	WFtOD+j0C58Am1aHZKI4+q7e9UYBHaXaIgwVKWJsGr0R2ake3/LauzXvWnbw4iS3JsdNTqR/9N5GK
	+NHXYv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuGX-00000007LRU-0nbA;
	Tue, 24 Nov 2026 17:25:13 +0000
Received: from out-203.mta0.migadu.com ([2001:41d0:1004:224b::cb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuGU-00000007LOd-1r9q
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 17:25:12 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LtOf42LRb6ema5kG9lyhnRBIBEsKhg+Nu5OMnkMKR6Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795541106; v=1; x=1796145906;
 b=xmSI12ceCe6f3psuv8sjdfGJt1qVm7LnkuUnXKnWK8NksrJuFD+/fwzQuj2UyNcE9zdAomIJ
 5Caa2YJG7U60rPatvAv3FSBlRbX9HAX49FzSzMuCYW/SGIuAxq/L89RvJayTnUQlBCsggb1WGsq
 lFzVsNeRhzXfsQE5D/+7lwNI=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e81a7298d22543e7;
	Tue, 24 Nov 2026 17:25:06 +0000
X-Mizu-Trace-ID: e81a7298d22543e7
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 18:24:29 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 8/8] riscv: Add BRS SBI requirement
 tests
Message-ID: <awXH92cKFHKZKPFp@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-9-wangxiang@iscas.ac.cn>
 <awAxIHVLgbqTIYq5@orel>
 <be563f376884fa46178aa4f78468aeb13272506f.camel@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be563f376884fa46178aa4f78468aeb13272506f.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_092510_756485_0AB48F32 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 08:50:20PM +0800, Xiang W wrote:
> > =

> > I've sent https://lore.kernel.org/all/20261120135613.1388647-1-andrew.j=
ones@linux.dev/
> > to avoid having to do all this DT parsing in the test code. Your next
> > version should add a patch that adds the ACPI support for setting
> > thread_info.imsic_addr and then this patch should use it.
> > =

> Thanks for writing that helper.
> =

> v3 will carry your DT patch and add the ACPI side. The BRS tests then=A0
> just read cpus[].imsic_addr.

Let's rename imsic_addr to imsic_pa

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
