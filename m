Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71801EBFD02
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYB6E/JxbJ3p8EJSL+f7z42pgxjwQGka2z4knORwigo=; b=i0a//F8TX+0mih
	42umIQPNh7pqwkgSX+jx3NBiSgXB4ehplu4FMwoUT87tbH7MJya8h5CDITRcm+Z954KmlzRM1Un/P
	RP2aLtQqcvyoP1n8k0R5KJ+vgvS5+guL+3Q49Uhi8Issxs4ABDVL0NDARZ+RIRpr0dtWkWPCEoLzt
	0YhOK25B7LSU0vZ9j/dAif+579v8FWgUU9FK903e9805sqdma0hcwpaLJGZjBsR3HtjlPjdYWPy/2
	DoKpkBg4P1WvHrG2ef8qQdlLb5jzrtubA5rtw61aZXLMYejYkZ91jJpR8TAvVlnka0/W6R6HCPpJt
	UrdhBNJYp85LfUlbsmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAtE-0000000F580-0PL5;
	Mon, 13 Apr 2026 06:35:20 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAtA-0000000F57E-3Ns5
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 06:35:18 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-68c048f9c9aso802279eaf.3
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Apr 2026 23:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776062115; cv=none;
        d=google.com; s=arc-20240605;
        b=NHJP/7LsRjGNdAtR3dkpM+idi4+zs9O0HsKCtlcGiHxLlnl50WLwzE5iyZ1No+kQFM
         ej8/dZ3t9WnzBKdW92ph3mMxTbWQjmM3brA+ps3CoQ8Mo7XV+nnbVGaIj43DlBBjEDfv
         YeHmpn4J+0QyNrMFDFrxlE2xPoUKjIHkxIkTUxfqYZU3JdWSZwQJFL4jevOSqHp8Saq9
         pLahgLJn8DYiIzT4zqjBtkGjE76w14TxvI03ppguHHd9ffFwHHv4C/ywlv8gAouAQlX3
         tvcPF7tU339fRqfes7BVVX6N9ZR/J77WKdTzT6vYkMsKTRK3M1A14yAx4HiCZ42xoWRQ
         Vz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhmEYjR6/quzdnxRuC7TxxzEx+eEg6dd48C0268iWf4=;
        fh=5pJPkeZqxy9MQmmbrQ9WqYQkr7NBO+BkH9PnmCYhPFs=;
        b=lPX2ihL8C6H17d5/F3Sv6ShwZ492pX2PkSAYB2FovLVBKAQwvqioZd6PDF1GLn0v49
         UUw2QZmIBXR1wYouI4BJ7QotJYG29/8w+orVG/IXE/QkbuIcZQGAA1bDbVtjvx5rB8vg
         fQAY9LiWx+aiQhsCD1JUSEOhNPZzRe+/8LJpD+z4xKAse94emutdlpeb/tRYO5gkan4v
         6Zm79+91hPX8I0yGISgEafoswgg+8TrnTZlPukl03rn+RrPPNFmu3gwL/AN0PnSiSPBB
         c5hI/9VYtQVJmeD0em1o1ej/f5inHFI26xBoTu7pg4JUgo2rR5MKQ/MS2eL+gJVI1Daq
         ueNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1776062115; x=1776666915; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhmEYjR6/quzdnxRuC7TxxzEx+eEg6dd48C0268iWf4=;
        b=BMaJSD0TrsA8ygTRbWRcM/5QwNme4Qr/sKVWETsZTf6FpAaSxXKlbUK4Z0HlpTlpI1
         gcHhdCECU8YOO6MuuZTHDsupktoXAirbgi5XBW47agyPRqBimcCwp7oXCKasbEE8iNsQ
         OtO04lZpPZFeBEkcul1nte0gstCpGz+jKYhxN2DxpbSYT/0Oh4H+BSt0YvTbO4tAM30w
         1nc0cRlwJpWI6ikyRdFfrmuLhQCX3BvTQe35E2giLix427uh1aD2CtyvF1IYMYVRAoVI
         5lKKIofkqOv5OH9hfctsd/zz+A7/ljkHaGYJhHxmyPGvNIFjojzjGVwosTkvzY65MNPs
         v1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776062115; x=1776666915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IhmEYjR6/quzdnxRuC7TxxzEx+eEg6dd48C0268iWf4=;
        b=SkJEXBs0JDzjTqhXr1veftuWOfO3DH/rpSJyBWqbh2STVCzxuUlDetpD6FoBYN32Li
         2DogdQ9ag3v6dqyy6/FTN/kT9kBqh/kdUbAqdpaeZlYCitlkeGoIQYTcIeKkharz9rn2
         WNkWJALiVM+S9ng9CXhNx7ObBqsOtcpOINjbEPrkMkthiLiI+rBqTIzGTPNSm4ZcUmAx
         pnKZP6Aif7emOdg/uJKx45u6copm/XmdQCBmtXJy5hS3TxoYzvYPuohwlEon8mnbcvhs
         lqrGjgjDQglvWpybJmb8pj2qGjR+NCEWvuby9Ce5Lt/API5oBaqT8KCu4ct6+wvGn/Ef
         PsDA==
X-Forwarded-Encrypted: i=1; AJvYcCWhRPFdnLDcs/f+LGFhdgt5OqMJNAE2vOUwOrmqaYpzJCj1YNn4wZYkPamp9PPMuRJDx0w8LryeCBE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9YtDvK93j/aa/Oq96FE3q5P04vD9oZMnVpe1PfVSaslCORYq+
	PzmiuD0SEReITFC9sShu7XQwNMvznbvA18Thwj7AiI0DeSO7Dd5HxO1tA6KciHKnung+XIT+73+
	tUJp1WIlZEex28A5kKYLNHyIjqk08h+huGj7eNpD87w==
X-Gm-Gg: AeBDiev0Q0aSwfmfwK5BKy4v5237VSqgdl0ZZXReY06BZAevvWKQelMiiVikTe7tLvG
	zyFVj6yZjH5ES/qTa9gX3spxbkE4flBc4rLrpIN7UXDzEqVIRnSY2rsmdU14CsfhNMaYBZShjbl
	8xVYakwB64JIVfqjmPbR5ybXkhVN6W2cCIhqS/8SAKeZB14INbJ0guQFOPNKkyIqAnG9Z6HBhHi
	9VADzUQC0lIFy+jthKX/hODCSWdbiRKyvam/fI7HHloK8BYj9SoqLsBTBPXww8o7woJq/sbZ2MI
	rlAzVYoKGWo8bW7vsTJCjnk/HvollPYhYU81n79SJ2OZWMzt/Y+mKco0C41LL761T75Cd8Ay+Ib
	CgCo5nIGittXCLN57AxcNG7z9F7Sj+W/9dHua
X-Received: by 2002:a05:6820:1843:b0:67e:aa1:8825 with SMTP id
 006d021491bc7-68be7ee694fmr5678237eaf.35.1776062114774; Sun, 12 Apr 2026
 23:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260413054439.1715082-1-mikey@neuling.org>
In-Reply-To: <20260413054439.1715082-1-mikey@neuling.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Apr 2026 12:05:03 +0530
X-Gm-Features: AQROBzCcl-LJ0nMVT4pylFo0k7IEEc2v2cILLcr4BVOVjWfJLHs-ruU1CPsIK8A
Message-ID: <CAAhSdy1AG8N3iGJ9FLK+JPurnDv24ABP0LNhvx19ig1WHo8FxQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: KVM: Fix memory leak in vector context allocation
To: Michael Neuling <mikey@neuling.org>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	vincent.chen@sifive.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_233517_092578_6403A2CC 
X-CRM114-Status: GOOD (  18.86  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMTE6MTTigK9BTSBNaWNoYWVsIE5ldWxpbmcgPG1pa2V5
QG5ldWxpbmcub3JnPiB3cm90ZToKPgo+IFdoZW4gdGhlIHNlY29uZCBremFsbG9jKCkgZm9yIGhv
c3RfY29udGV4dCB2ZWN0b3IgZGF0YSBmYWlscywKPiB0aGUgYWxyZWFkeS1hbGxvY2F0ZWQgZ3Vl
c3RfY29udGV4dCB2ZWN0b3IgZGF0YSBpcyBub3QgZnJlZWQsCj4gY2F1c2luZyBhIG1lbW9yeSBs
ZWFrLiBUaGlzIGlzIHRyaWdnZXJhYmxlIGZyb20gdXNlcnNwYWNlIHZpYToKPgo+ICAgaW9jdGwo
dm1fZmQsIEtWTV9DUkVBVEVfVkNQVSkKPiAgICAg4oaSIGt2bV92bV9pb2N0bF9jcmVhdGVfdmNw
dSgpCj4gICAgICAg4oaSIGt2bV9hcmNoX3ZjcHVfY3JlYXRlKCkKPiAgICAgICAgIOKGkiBrdm1f
cmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4dCgpCj4KPiBOb3RlIGFsc28gdGhhdCBrdm1f
dm1faW9jdGxfY3JlYXRlX3ZjcHUoKSBkb2VzIG5vdCBjYWxsCj4ga3ZtX2FyY2hfdmNwdV9kZXN0
cm95KCkgb24ga3ZtX2FyY2hfdmNwdV9jcmVhdGUoKSBmYWlsdXJlOgo+Cj4gICBrdm1fYXJjaF92
Y3B1X2NyZWF0ZSgpICAgICAgICAgICDihpAgZmFpbHMsIHJldHVybnMgZXJyb3IKPiAgICAgICBn
b3RvIHZjcHVfZnJlZV9ydW5fcGFnZTsgICAgIOKGkCBsaW5lIDQyMDkKPgo+ICAgLi4uCj4gICBh
cmNoX3ZjcHVfZGVzdHJveTogICAgICAgICAgICAgICDihpAgU0tJUFBFRAo+ICAgICAgIGt2bV9h
cmNoX3ZjcHVfZGVzdHJveSh2Y3B1KTsg4oaQIHdoaWNoIHdvdWxkIGNhbGwgZnJlZV92ZWN0b3Jf
Y29udGV4dAo+ICAgdmNwdV9mcmVlX3J1bl9wYWdlOiAgICAgICAgICAgICAg4oaQIGxhbmRzIEhF
UkUsIGJlbG93IGFyY2hfdmNwdV9kZXN0cm95Cj4gICAgICAgZnJlZV9wYWdlKHZjcHUtPnJ1bik7
Cj4gICB2Y3B1X2ZyZWU6Cj4gICAgICAga21lbV9jYWNoZV9mcmVlKHZjcHUpOwo+Cj4gc28ga3Zt
X3Jpc2N2X3ZjcHVfZnJlZV92ZWN0b3JfY29udGV4dCgpIGlzIG5ldmVyIGNhbGxlZCB0bwo+IGNs
ZWFuIHVwIHRoZSBwYXJ0aWFsIGFsbG9jYXRpb24uCj4KPiBGaXhlczogMGY0YjgyNTc5NzE2ICgi
UklTQy1WOiBLVk06IEFkZCB2ZWN0b3IgbGF6eSBzYXZlL3Jlc3RvcmUgc3VwcG9ydCIpCj4gQXNz
aXN0ZWQtQnk6IENsYXVkZSBPcHVzIDQuNiAoMU0gY29udGV4dCkKPiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIE5ldWxpbmcgPG1pa2V5QG5ldWxpbmcub3JnPgoKQSBzaW1pbGFyIGZpeCBpcyBhbHJl
YWR5IG1lcmdlZCBmb3IgTGludXgtNy4xCihSZWZlciwgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYwMzE2MTUxNjEyLjEzMzA1LTEtb3NhbWEuYWJkZWxrYWRlckBnbWFpbC5jb20vKQoK
UmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyB8IDQg
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfdmVjdG9yLmMKPiBpbmRleCAwNWYzY2MyZDhlLi40NmZiZjQ4ZjI1IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3ZlY3Rvci5jCj4gQEAgLTgwLDggKzgwLDEwIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9h
bGxvY192ZWN0b3JfY29udGV4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gICAgICAgICB2Y3B1LT5hcmNoLmhvc3RfY29udGV4dC52
ZWN0b3IuZGF0YXAgPSBremFsbG9jKHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJORUwpOwo+IC0gICAg
ICAgaWYgKCF2Y3B1LT5hcmNoLmhvc3RfY29udGV4dC52ZWN0b3IuZGF0YXApCj4gKyAgICAgICBp
ZiAoIXZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkgewo+ICsgICAgICAgICAg
ICAgICBrZnJlZSh2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwKTsKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIHJldHVy
biAwOwo+ICB9Cj4gLS0KPiAyLjQzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
