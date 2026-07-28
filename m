Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC17C54F4C
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bsNsI5M5VKDGg9QDjEheiTDn+q+Y09JObxLRihzcMc=; b=PD2z98pcGYXqX5
	6iCy+vIM4hEiKdZON3le9YD4M5W2ldBZT636q1cW/8dEeLIu8aOxjGYXxdWyqRycOTf+QIqQJ5vCZ
	NHl7MNPBujxMWFaTG/cUghlaBppjTI8bZhkgMjV0GrFBaJGg4y+PDoiP3fw5a0a8xvGRFQBO+Z2wt
	+xLYUGT5KD5T4nDw+ywTHb0KqIWUnbmrCxuiGdcpsssvUAvn4sbGqRQPIMjPvtjwUo1S6K2Seun/h
	0XzKr+aCMmTZv7pLv0vhEmABsu8TLGaYCMO+SoEciF2xAIhxEGbpx49bU9EzbLLL84i0ajE1swVif
	FHaAXv9jkBG1Y6VJAgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokBY-00000005kKl-0dzx;
	Tue, 28 Jul 2026 15:57:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokBW-00000005kJ8-0M8n
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 15:57:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so36830725e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jul 2026 08:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785254256; cv=none;
        d=google.com; s=arc-20260327;
        b=SyiAQPiZDYV7U7js2NNKV+Gl93fIw95H81n1er5O1zuor1ucHexY0qhuWKGQFXuaCv
         q5kVwftqiApKzVhTiTuRkLNTUPKf+PLZxJv36yKzOn39w7GUPv+7FWtoSgRKj8pX03V1
         ijOy6sjaZN2eMPchFxVJkPfbx/YxT67bkA35Gk904cHcoHx32iKNZC7xNkc0sB4G0c6W
         RizeLqLnp59M6iG2Nm5CVXEsT6djMx0p+KOYuzFkEfGt8gwnvH0MRAyTtIV65idguWmI
         By9bPCQ5obuWxHKbjowVvHrl5PQ/70her4EYrNULr9keJKFYZzaEp8tnmmQGvnJoEG48
         JDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lf9wr8xON851k87cAfYBV+mb2qc9bEeXow5dSdf9Cb8=;
        fh=gYwuWbF0hGETt6tXbQZr78PBMuqhOd/QPCo1+ErRJNg=;
        b=VKLLLxgtjlgaeg9I6Tao90fEjTVvbcrRzjVzSIU3r6trZ87FiUJ+gl+PkTBcZSDVgx
         d7cSm3R/htMQidOLgUzGzp3+ZBmKXW1ryf5hB0+b1v1DaE57ieQLw7iMyCXb4RY7lkES
         a/0FeSt34zrXxp8UN+aLRMHIdjjPW8W8WOiG3RFDE4Z2UUUuaG7CPswswNxjrA8JZ1ps
         a9q3v9uLVdq5+/mfqilBtIw/d6hDUvj9bqz55OD87ag4mazlETRxHI7xqYskbHiPSR4J
         Y8kbjPfmO/qGHW5jlKHh+nnai0bJ0edY4qSim5HHn3oB3wfm3gzPErR0Z3Skk70aFZLO
         Ibww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785254256; x=1785859056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lf9wr8xON851k87cAfYBV+mb2qc9bEeXow5dSdf9Cb8=;
        b=bJHg9uSFeBBNYr0JFfhseLXVGazF3kMftkIQ5gsdCukduwePvi7GLcJuTF14gE4ZzH
         5uqfIIONzIUIO2VTTxwpUP/5R8/WEL80kks0Sy1wb2ryGyqJ1WIdosfAQZm0BTTfxv2O
         Uy6OB05s/aSJIa3Q2+6tygcMRhsaiJc3JvqxkIUmqT9aSUglnd8QJRZE5a5aKCc5B9CE
         1myTR8a/BhqGkeXR4wsgX7NgN59JLgAb1qP1Z27bHm6BaxWoHtpENA/2X0C421WcZv6B
         833mOpjyUO9Mk+dRKdnSdU7Keah11d7K4AzJO4gr2VgHUsq+ywL3+LhBX0ObKfEKxci3
         urIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254256; x=1785859056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lf9wr8xON851k87cAfYBV+mb2qc9bEeXow5dSdf9Cb8=;
        b=TULS0qqtbMEhLeVr8RRQaz6klmX6oDL8owjWU7HBP7iIHstqT48ktOVpYfGgZ8YufW
         CHpDeeJYOKIlom9MRnbTlL+p1GB6l8hTqjcxEWqGwoH3e8GfRXu4kzop+igElWu7tV49
         szPbHncG9FVMQ4ZqO75id5kqkkXaCxZzKsL7ORwxloq+V0WxmBP//HP9N8TuPblZb3Cu
         Q68tR/roGAyrJQJD7/BZ7YVMNwewo9FmT4JR7zWb21iBFaF9XL2svAI4dub5GkB5og0F
         yZweSk4Ux4aimb7ZmMmUZ5JmiHKKyFhGTI3mHT+8mFL2zCdRoj6qbmvvcm/D+KqYTctx
         yc6g==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Z2SQHKWczvTEYSYqtY0Wl8z8d3BJXX5ESE4zTTShZJQ2MoX2gCyft5oImWQYhGJwk7ygIDjzZD0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz4EZFyl53NRTsOHtjLx+dbt7RC+3M5/kaQUnel72nsUaYV2f+
	9+uY8MONWWQFrw//HDFKTt1WXg4aWRyGqezLuGPcY0jiwf6LP7ewLmGnhxBddz+/G5118jjl6rp
	R6xqepVPWrQPV/qXNif6qVuOaJIq8YxpLKMVUrU4+v7+j04dH8J8+IVWRRw==
X-Gm-Gg: AR+sD12Iu7NZLPf65ydbcPYwFEBFd8TOVRIeYKPCaH5z3Npy7rFORcZFINmCluE4t02
	b2iIC3H4+LWEFZ+ZZBb+r3y5azSrMbHuaQ97+rbM6/XBQg2zJmuztQyZsIkzqZ+thEKMeD8gk7+
	awD6MsWYqFUgRTSsMwOhEUyBH512f/M0qDK9UMZjgS7Tvw9XLNuWIhkReTGG4Lp2dYY7pnhIpEN
	fzV30mi+w03hXFwDlUXmg/22Wb/c1ld4lx5BqIP0Lzc3PIWDCqhjqcC2N/ByALFEAJlJ/jwVrIT
	28iHIxE0JLezh/WFbKs+GwFjMzc9FKGd6AYnywzV1Q+64Ml+AOQu+0NyBnjohMj6N7cbM3ddvxE
	JbGF9
X-Received: by 2002:a05:600c:348c:b0:495:4fd4:f7b6 with SMTP id
 5b1f17b1804b1-496c659f7e1mr36007685e9.37.1785254255988; Tue, 28 Jul 2026
 08:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260728141938.95845-1-yang.yicong@picoheart.com>
In-Reply-To: <20260728141938.95845-1-yang.yicong@picoheart.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2026 21:27:24 +0530
X-Gm-Features: AUfX_myWbuJ1vCxTHkL5qUQMNMMORYmpwxFlrJVlhYBqJ0prODKRN7X_pkzowJU
Message-ID: <CAAhSdy0a30XuKJGsRHf4p3BkO0vbJLWij9xp-CPKd7Rj2hjyCw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use try_cmpxchg for IMSIC MRIF RMW
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, geshijian@picoheart.com, 
	shenyang.young@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085738_165240_7C36EE80 
X-CRM114-Status: GOOD (  17.89  )
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

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgNzo0OeKAr1BNIFlpY29uZyBZYW5nIDx5YW5nLnlpY29u
Z0BwaWNvaGVhcnQuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSB0aGUgUk1XIGZvciBJTVNJQyBN
UklGIGlzIGltcGxlbWVudGVkIHdpdGgKPiB3b3JkIExSU0MgbG9vcC4gVGhpcyB3aWxsIG9ubHkg
Y292ZXIgdGhlIGxvd2VyIDMyYml0Cj4gb24gYSA2NGJpdCBzeXN0ZW0uIEluc3RlYWQgb2YgZ3Vh
cmQgdGhlIGltcGxlbWVudGF0aW9uCj4gd2l0aCBDT05GSUdfNjRCSVQgaGVyZSwgdXNlIHRyeV9j
bXB4Y2hnKCkgd3JhcHBlcgo+IHdoaWNoIGhhcyBhbHJlYWR5IHRha2UgY2FyZSB0aGlzIHRvIGZp
eCB0aGlzIGlzc3VlLgo+IEl0IGNhbiBhbHNvIHVzZSBBTU8gaW5zdHJ1Y3Rpb25zIG9uIHN1cHBv
cnRlZCBzeXN0ZW0uCj4KPiBGaXhlczogZGI4YjdlOTdkNjEzICgiUklTQy1WOiBLVk06IEFkZCBp
bi1rZXJuZWwgdmlydHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKPiBTaWduZWQtb2ZmLWJ5OiBZ
aWNvbmcgWWFuZyA8eWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNj
di9rdm0vYWlhX2ltc2ljLmMgfCAxNSArKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXgg
ZDM4ZjVkZTA4MzRjLi5jOTIyYzAzNzM0NGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
YWlhX2ltc2ljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBAIC0yMjAs
MTUgKzIyMCwxMiBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBpbXNpY19tcmlmX2F0b21pY19ybXco
c3RydWN0IGltc2ljX21yaWYgKm1yaWYsCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgb2xk
X3ZhbCA9IDAsIHRtcCA9IDA7Cj4KPiAtICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgKPiAt
ICAgICAgICAgICAgICAgIjA6ICAgICBsci53LmFxICAgJTEsICUwXG4iCj4gLSAgICAgICAgICAg
ICAgICIgICAgICAgYW5kICAgICAgICUyLCAlMSwgJTNcbiIKPiAtICAgICAgICAgICAgICAgIiAg
ICAgICBvciAgICAgICAgJTIsICUyLCAlNFxuIgo+IC0gICAgICAgICAgICAgICAiICAgICAgIHNj
LncucmwgICAlMiwgJTIsICUwXG4iCj4gLSAgICAgICAgICAgICAgICIgICAgICAgYm5leiAgICAg
ICUyLCAwYiIKPiAtICAgICAgICAgICAgICAgOiAiK0EiICgqcHRyKSwgIityIiAob2xkX3ZhbCks
ICIrciIgKHRtcCkKPiAtICAgICAgICAgICAgICAgOiAiciIgKH53cl9tYXNrKSwgInIiIChuZXdf
dmFsICYgd3JfbWFzaykKPiAtICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cj4gKyAgICAgICBu
ZXdfdmFsICY9IHdyX21hc2s7Cj4gKwo+ICsgICAgICAgb2xkX3ZhbCA9IFJFQURfT05DRSgqcHRy
KTsKPiArICAgICAgIGRvIHsKPiArICAgICAgICAgICAgICAgdG1wID0gKG9sZF92YWwgJiB+d3Jf
bWFzaykgfCBuZXdfdmFsOwo+ICsgICAgICAgfSB3aGlsZSAoIXRyeV9jbXB4Y2hnKHB0ciwgJm9s
ZF92YWwsIHRtcCkpOwoKVGhpcyBwYXRjaCBpcyBhbHJlYWR5IGJyb2tlbiBiZWNhdXNlICJvbGRf
dmFsID0gUkVBRF9PTkNFKCpwdHIpOyIKbXVzdCBiZSBkb25lIGluc2lkZSB0aGUgZG8geyAuLi4g
fSB3aGlsZSAoLi4uKQoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
