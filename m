Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86401C369D5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 18:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UDjhuqKG1FQi/AxePkpfzJ2Ar3lUEuDT+oQ+ayfADA=; b=JXYol9qkuY9vmm
	yuZLHFI7gEU7SWbG2eD1dJ0u1BCHKbBnfDp9beNOqCw6BJMFfXF87tf0Bs38GceVwQNNypVDgLQQC
	1ip+M3Kq5/hLUe5jMvRLPriT5iURHfERzxbJDM/y+YddbWbrUG6O3YpNMOKejcaRryKnu2D2zkiJ0
	IyWpydI6obH3Q75PxaHC/JMNeGGM0md/5kfgSl5npFlXnWbeKAz44NLejdQMdIHF3NvLKLRZN/PV/
	zslURUetDf96a3t75WenLjcwA4vJjO+hEdgw8C//KD2mI/WNw8WfAfPDga6vvGlDGfiUhSmMnEFED
	/AINZ9TEfatuSjxraVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Smq-000000079rS-10sf;
	Mon, 28 Apr 2025 18:01:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Smn-000000079qS-1kYq
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 18:00:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3913290f754so591740f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Apr 2025 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745863256; x=1746468056; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZwXwtzXWmeQYckV0YYno1wNCKBMqM9oV5/JyBASh3g=;
        b=OmipBDJlB9udCxMhmglIz9Vr2w507SOZBXobXXvWiF5GtbbV/rLGlkrOjXfi8Ic00h
         CAcnA6I06/tor0vkY7DNohd40SOEvft50oLeiIDEgBsHOtigtAU9oSYIavkOZsUqsJPI
         6+TZ+66YczyMLZsdXHz0J1PHnK9KAJJX9O89cMZyyjMgS3Ef4u3mM4ZEYuxjyyJVGXtT
         xRbOyOpZIvxjREFR/Wop7JkTErlOu886/NOqf6faGkcDs78DRR7q+MvM6tVqwAWSIeTh
         n8+3hBuqe8sBET+0ug7ICyFFW+G5NHiEaRWqtVULE65A2IFr3RRCpWNwri8X5SZPi3Qp
         emkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745863256; x=1746468056;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZwXwtzXWmeQYckV0YYno1wNCKBMqM9oV5/JyBASh3g=;
        b=HcDwBRnANKOcXzeuKygw4FimmcUAKhfhK9NbYyjax0hjWC3C2CU+vPr/ZjcLZIXuBG
         whKFuTZYTYgFVrEwllSrKyEM22BFOneHRoIphSw7dqJZ7+C8/svSpq8GJO+ArK6zkaDu
         /BqxpMihhRCRTrBRnqEd4z8MPm+apGTM2yXwu06u7OrYMyYnPz7vM5iB9EVzy54MJQlW
         nspY0T3gDIiko6b70m7sU0D5See7TtorVX1VB4C8Nq33xolJTRSD8SrTo0XWF3iaXRLZ
         CLrnkqF6lytUVH0CFvkoyUINCw0Wc1Ah0FSP4tNVh+4F4kxN1QTcxrl6tquSjh52FEqP
         bNVw==
X-Gm-Message-State: AOJu0YyePpNFKY2/4nE3Hkqr0SbjkuHZkTv7aTkhEsVFY3S46kRokZYP
	aw8DokqWXZuMB8pnmQJrGe6yehfDOaBz3/58mvjN4xksVKdBd9yvd7D3gz26Fx8=
X-Gm-Gg: ASbGnctmPo+mENa57mhR8H11MEvuYZRC07Yd3BPa0o8GcxJqFWBCUdQeVISBh2SvQG3
	ycJPv+XRbp6swmdDrBi/BSkKMrBnvijb94DcQ+C6SdtFB5FdKRfkQdJxFV+XGeQ5F8jac6t41+k
	uCwaL+nQztz+aExXj93yHBoK0W4sf9DnnXA0MCYxKHrdjlgMWG//KMsi2qWNe2c4fYEb1yMG/Bb
	45fpcKDfDNC2jIM80JrvjKIkDqCS8eFvZyb96y8eDmoeLEmG3x2KJFMu5wOz+f7POO+1JThAZ0V
	jdNOsKZxg2xrbM1n2z231dIKz9yM0my/POhNKzauTGdqfh8=
X-Google-Smtp-Source: AGHT+IEoLn0qfVLaHBdPIxVZ7lJCgR2On0y4jpuci39/L3rmNtHaRZ20QzdrYfwyAYvWF7jRY9MHSQ==
X-Received: by 2002:a05:6000:1886:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a08a3438camr79148f8f.12.1745863255647;
        Mon, 28 Apr 2025 11:00:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:785:f3a7:1fbb:6b76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbdb78sm11569680f8f.41.2025.04.28.11.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:00:55 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Apr 2025 20:00:54 +0200
Message-Id: <D9IGVF0OY4WJ.1O1BX0M2LWUVM@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 3/5] KVM: RISC-V: remove unnecessary SBI reset state
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-6-rkrcmar@ventanamicro.com>
 <CAAhSdy1RSpVCUzD+Aqbhh7aiQPmC2zdvuQfuOsmYNJrF3HxCsA@mail.gmail.com>
In-Reply-To: <CAAhSdy1RSpVCUzD+Aqbhh7aiQPmC2zdvuQfuOsmYNJrF3HxCsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_110057_448987_C904A32D 
X-CRM114-Status: GOOD (  16.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

MjAyNS0wNC0yOFQxNzo0NjowMSswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgU0JJIHJlc2V0IHN0YXRl
IGhhcyBvbmx5IHR3byB2YXJpYWJsZXMgLS0gcGMgYW5kIGExLgo+PiBUaGUgcmVzdCBpcyBrbm93
biwgc28ga2VlcCBvbmx5IHRoZSBuZWNlc3NhcnkgaW5mb3JtYXRpb24uCj4+Cj4+IFRoZSByZXNl
dCBzdHJ1Y3R1cmVzIG1ha2Ugc2Vuc2UgaWYgd2Ugd2FudCB1c2Vyc3BhY2UgdG8gY29udHJvbCB0
aGUKPj4gcmVzZXQgc3RhdGUgKHdoaWNoIHdlIGRvKSwgYnV0IEknZCBzdGlsbCByZW1vdmUgdGhl
bSBub3cgYW5kIHJlaW50cm9kdWNlCj4+IHdpdGggdGhlIHVzZXJzcGFjZSBpbnRlcmZhY2UgbGF0
ZXIgLS0gd2UgY291bGQgcHJvYmFibHkgaGF2ZSBqdXN0IGEKPj4gc2luZ2xlIHJlc2V0IHN0YXRl
IHBlciBWTSwgaW5zdGVhZCBvZiBhIHJlc2V0IHN0YXRlIGZvciBlYWNoIFZDUFUuCj4KPiBUaGUg
U0JJIHNwZWMgZG9lcyBub3QgZGVmaW5lIHRoZSByZXNldCBzdGF0ZSBvZiBDUFVzLiBUaGUgU0JJ
Cj4gaW1wbGVtZW50YXRpb25zIChha2EgS1ZNIFJJU0MtViBvciBPcGVuU0JJKSBvciBwbGF0Zm9y
bQo+IGZpcm13YXJlcyBhcmUgZnJlZSB0byBjbGVhciBhZGRpdGlvbmFsIHJlZ2lzdGVycyBhcyBw
YXJ0IHN5c3RlbQo+IHJlc2V0IG9yIENQVS4KPgo+IEFzIHBhcnQgb2YgcmVzZXR0aW5nIHRoZSBW
Q1BVLCB0aGUgaW4ta2VybmVsIEtWTSBjbGVhcnMgYWxsCj4gdGhlIHJlZ2lzdGVycy4KClllcywg
YnV0IGluc3RlYWQgb2YgZG9pbmcgYSBzaW1wbGUgbWVtc2V0KDApLCBLVk0gY2FycmllcnMgYXJv
dW5kIGEgbG90Cm9mIGRhdGEgd2l0aCBtaW5pbWFsIGluZm9ybWF0aW9uIHZhbHVlLiAgUmVzZXQg
aXMgbm90IHJlYWxseSBhIGZhc3QKcGF0aCwgc28gSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIHRv
IGhhdmUgdGhlIGNvZGUgdGhlcmUgYXMgc2ltcGxlIGFzCnBvc3NpYmxlLgoKPiBUaGUgc2V0dGlu
ZyBvZiBQQywgQTAsIGFuZCBBMSBpcyBvbmx5IGFuIGVudHJ5IGNvbmRpdGlvbiBkZWZpbmVkCj4g
Zm9yIENQVXMgYnJvdWdodC11cCB1c2luZyBTQkkgSFNNIHN0YXJ0IG9yIFNCSSBTeXN0ZW0gc3Vz
cGVuZC4KClRoYXQgaXMgd2h5IHRoaXMgcGF0Y2ggaGFzIHRvIGFkZCBrdm1fdmNwdV9yZXNldF9z
dGF0ZSwgdG8gcmVtZW1iZXIgdGhlCnN0YXRlIG9mIHBjIGFuZCBhMS4gIChhMCBpcyBoYXJ0IGlk
IGFuZCBjYW4gYmUgZmlndXJlZCBvdXQuKQoKPiBXZSBzaG91bGQgbm90IGdvIGFoZWFkIHdpdGgg
dGhpcyBwYXRjaC4KClRoaXMgcGF0Y2ggb25seSBkb2VzIHJlZmFjdG9yaW5nLiAgRG8geW91IHRo
aW5rIHRoZSBjdXJyZW50IHJlc2V0CnN0cnVjdHVyZXMgYXJlIGJldHRlcj8KClRoYW5rcy4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
