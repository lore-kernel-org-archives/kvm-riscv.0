Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557C460A263B
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CZTbaPvq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dHvhQour
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e+T0Uqj9RVfqlVtV+3szI2THX3qPTNAyHMn3UB9cmSI=; b=CZTbaPvq3gZUIYyJG6gacckUvw
	o9IKZQGGaUnUtfZhWsNtGHNmFspH7qx31voakV9ceZWpQOqDgtqFuB0iweW5se02KtO/+YmQ+thD9
	ePNbDxYLZoEn5DfAqRfWQyfCh6zc+vWQDM9uioA5da7ANmPz4hKOwdzf/uryw1Cfb3xoYgNhqsj6R
	uuvJXPKHC6bFoq4nfGmQnchUfH3z1x0Z4EF328bkdo7fB/TN+Q0Th+YXiPbHGtCfmXix7Dd3v362p
	rozd2bpEslwrXWH0qY19fnfROkDdFS5zFTVvOs9Ov2VUMcbAs4k+4aqlbOsoMvhpkxX30N/9vY3ot
	8Wb5LFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmkF-00000004BK8-3e97;
	Tue, 10 Nov 2026 14:22:43 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmkC-00000004BIf-0AW6
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 14:22:42 +0000
Received: by mail-pj2-x09.google.com with SMTP id 98e67ed59e1d1-3b0ae89de91so1222335a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Nov 2026 06:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320559; x=1794925359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vW6Me650CnRCbqpTMm9ScZes8RV1bkmpcr+ZWjp/+oI=;
        b=dHvhQourcefQEe+JE3xWmUbKha+rhu7lnPEioJZ+ueb3Y4F37RQ7KJTwSZhBS7LblC
         z0s21PKom3CWoEX8KwSRUqLN2wpXGpmfWiiQWojy5rDnqfqfVGR+MblYawzFOHGEpWSo
         um9UAZ2mwu1PwltYsYC+h8Buph1543KQ/8yAXM94GKPYDHtUR1/iCj1hlobGbsuMyISs
         AVVvaB1fRHK26Mm/fvnsxRLpG1S2R+gJD+3NhyqMmCQ+bkIiyK7z+MzS82i1LWbkfCr3
         m4DseGRxofvbiYPy5R1aeAxVVZCkU7dWNTJ4KdqTTGMvXLReVKfD8YUF/9yall1vjbT1
         KISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320559; x=1794925359;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vW6Me650CnRCbqpTMm9ScZes8RV1bkmpcr+ZWjp/+oI=;
        b=jpP1xiDE4Vu/il/VPOh8co6Yo18LgjwEixoK7sLJrPrzwNw6qthqh7GUZKfxhxmyuU
         EwRB+TrvLpV6wHe/3LeF3Yl38pbKg5kWzkr9vzvSff9cJrZ+QUx2Qr38OPdXLqO49JP1
         BpSAkl0R3D5VbJXLp7yTGIurtHAumtCXsD0sJuvNYujdAcsVl4Dkb+e3tE4cEUlo7VGp
         x5HTHfXcsEwY7CcmRONbVJG3lPKoiZ5ttf8Z2QNSto364ZxSnQSRrkJjZT6U2vlQJ3De
         M+0A4YlkyEWDMQWJp0sOj1/OhLazlE7mEiRd5XWUC6doVZjgQh7ZxMOHnbzkaR5kHQJ8
         +QRQ==
X-Forwarded-Encrypted: i=1; AL+hErGLv+tmEXoI4ebGt1elXxzwV7ZqLnorlswL78nObWEW4V+iz2tlC0YYk8d8+4FUkvR2pLqLd0xkyxk=@lists.infradead.org
X-Gm-Message-State: APuU4Z+n1sMOPIqf3KnsvZbdo8hptIAxP2d3KsP6yL2xbyvK5hAaLUr8
	Be07RKnhxMpnrceasx2Sazh5X4UzWtupgPfCThJYE4WlrDydlMs0mPJW
X-Gm-Gg: AYBFou2TdH+uJ10g7NckVz9JNsqCls55MJ4golDSX1Wdi0SQXu0qCPA2CkhIVG1ZwrZ
	1CGM74vu/A7A9RXtQKhjOYDO97WqQxUDsuSbWoVazWmSmNpnAhXuw3V7TWDqqf1fQDggSvgulzo
	PuTl6Eqi2v5zrvYk3ltQbps6ZKrP4TsA9JOyKW/TlLGgWAFVa4CXzmCwh9IMuoe//e5/1y9M18v
	Nl902/hH4ocvPGjib8yDo0q59GUzb2KoZhXRCm1JdWqxEsrEY1Xm5EUWa4qJaYdqyK0QVOdxYJg
	tcnu4mgY3/P5F1lJb1QvPVGdKm+73hLo5KPjUKHryodzik0BV5ga6D1AYtfBYseJriK3khuMCch
	3UF4b5Y4d+xjxz6nX3Z5Ibhq5UGBMUyGHtOHU3JEI4UyTrat2I2EUKHMXUWtmOUfGtMgoz73x2k
	Q08vdyupCblhKLbCl+AZFDs5TrIMW6fEDJVE0WgiVn836ZO1jeOaPm+fMZYvn1hxbJcbEE1uukw
	RzS/3T2u+HPmCUA13tLdwcN5dRDuwPOslM3o6RSbJCbC1KxZdCwXO9HlhBOqUIzPY7PGWXknVQb
	8RsFMOZv6NEOoZxuZ8E1JNEDu3FiymQl84ozCqlESOxATuNUipgKZlNn5rYtjL81duID
X-Received: by 2002:a17:90b:562d:b0:3b0:968f:fdef with SMTP id 98e67ed59e1d1-3b166cda37emr3135880a91.49.1794320558504;
        Tue, 10 Nov 2026 06:22:38 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm70817a91.15.2026.11.10.06.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:22:38 -0800 (PST)
Message-ID: <ce2231cc-e554-44fd-b931-5627219b534c@gmail.com>
Date: Tue, 10 Nov 2026 22:22:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, gong.shuai@sanechips.com.cn
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
 <20261110135615.8073-1-tanchi25@mails.ucas.ac.cn>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261110135615.8073-1-tanchi25@mails.ucas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_062240_085516_918C80CB 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGFuIENoaSwKCk9uIDExLzEwLzIwMjYgOTo1NiBQTSwgVGFuIENoaSB3cm90ZToKPiBIaSBT
aHVhaSwKPiAKPiBPbiBUdWUsIE5vdiAxMCwgMjAyNiBhdCAwNzo1MTozN1BNICswODAwLCBHb25n
IFNodWFpIHdyb3RlOgo+PiAgIDIuIFVzZSB0aGUgZ3Vlc3QgUFNDSUQgZGlyZWN0bHksIGJ1dCBh
bGxvY2F0ZSBhIHNlcGFyYXRlIGhvc3QKPj4gICAgICBHU0NJRCBmb3IgZWFjaCB2SU9NTVUuCj4g
Cj4gSSBhZ3JlZSB3aXRoIG9wdGlvbiAyIGFzIHdlbGwuIE15IGVhcmxpZXIgc3VnZ2VzdGlvbiBk
aWQgbm90IGFjY291bnQKPiBmb3IgaW5kZXBlbmRlbnQgUFNDSUQgbmFtZXNwYWNlcyBhY3Jvc3Mg
bXVsdGlwbGUgdklPTU1VcyBzaGFyaW5nIHRoZQo+IHNhbWUgUzIgcGFyZW50Lgo+IAo+IEFsbG9j
YXRpbmcgYSBzZXBhcmF0ZSBHU0NJRCBmb3IgZWFjaCB2SU9NTVUgc2VlbXMgc2ltcGxlciB0aGFu
Cj4gbWFpbnRhaW5pbmcgYW4gYWRkaXRpb25hbCBQU0NJRCBtYXBwaW5nIHRhYmxlLgoKQWdyZWVk
LiBJ4oCZbGwgd29yayBvbiB0aGUgbmV3IHZlcnNpb24gc29vbi4KClRoYW5rcywKU2h1YWkKCj4g
Cj4gVGhhbmtzLAo+IFRhbiBDaGkKPiAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
