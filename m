Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8210CCD6E4C
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 04:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAtT723lHfj+oDt/zsJLS++OEjE0HAathvcvetQff7g=; b=ui+1hLD+r4e0Tf
	qS21NIRrO4eDy+ycOtnCoJhJrCsgbat3g+UnM5MGs5WBu9ulKij9iKhW+2HlglPmwlY0ayTRo4hav
	4ZsxQi0R7p0Ii36ohyjkd6nc2sc1PPfKzHPPlHIC3tA+bcZpqSVt4qUyZvpiA74gf71sZuTZErGYH
	+FgJKct0njnyWw95JwcmT6NnhF7DNsZry+bikhL7JVUTnpRS6SwtULdhbvph3eH4YwphhnMHnP2VJ
	vyq+8NKBCmGessQ0GC/muldu7qp+hcjiAs1C4DURX6+tQXUD04P9xkh7Bb+U7Wg8WrMIr5Jff0GBY
	mc6WiS06KIr34xAlQS9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTufy-0000000A8Ia-3wyY;
	Mon, 01 Jun 2026 04:54:58 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTufv-0000000A8Hj-0L7I
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 04:54:57 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-69e06aaf0b2so1778015eaf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 31 May 2026 21:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780289694; cv=none;
        d=google.com; s=arc-20240605;
        b=h11U3vc2oRoXnjNjnm09oHgvD2+Ayuh8Pe9lOLSC7xsIt+vWmQlBP0nTRUixwv0uOT
         4YG2ydHU20aFDQkD1NsuZxIunAcDelgebZhtFHmDL4KuNI+wCvvVakjecS4cHLMzVeya
         tcJsiMz8z7qu7JqIKkbyIJk6s8fYcxc/2gLweXdLi9mBi+MVHV0BQJXpVGzUiBh/EjSJ
         hA9XxKo5C9M0Ql5sSf/DpDpTiIxOcsx3oECVvGoyY/xuuSFYYqMJb0d+EUIV4fjbRq7i
         ku5YEDnEXmYa6FtBELamxEJtZGQbWIoit2H5HnPpKRF0wZBK1sE0belH6LDq4e2Lx4D+
         DOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m8WkJ7GreGQcFtxECvVXSjHYEmfBxLt7EkdnmdGvJ1Q=;
        fh=d12kyS7V9VZU7OJ4uLozz9nyZS6SyKVjBXuvz++Eeyc=;
        b=WYTnDh26kSbIlXy/q229xtBBAGTJZYD5AHgxBv6IBhH2gZnuWsqLdSPf+ZoUhk6PD5
         mYeM1oYaeunX50p8c7gdOeoB2XQKZiXt+peYfwhpL6GEtEpNH3iZb+QZKE8wl3q12Zot
         3gNc5xVtZow565/+HpyF8FF5prv75wOSudFp8LqG5b7aiH/AL4uNUIVM39gOiWD/gcoo
         5+OCEW+pdbSTcKhUzcIAng+NVRvuQTwNsqiqI9abHjUpo/GNfhr9pILt8yhX35O1Cr9/
         oDTV1gu41VRE9i4J9n3fuP+PA+vzIjPqx/OhHJ8Dj1evexAioCmpZR8V5acenq1RMFFX
         wZIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780289694; x=1780894494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8WkJ7GreGQcFtxECvVXSjHYEmfBxLt7EkdnmdGvJ1Q=;
        b=zHwsvTLdC1JPFK+iPrCgtLIY1h7LhbDjf5SwxOhprBDiEarlSHS6pUYXXbvs3s93W9
         5MEi4uaUZOxbQAapQoDMROHupxRqoCX2xg1KUiebEEoBGjgbggBmLH+v5YVM4O5UEJS5
         8KSUphMc50UyAD1DJbRy+m1uwwyyzYqW5A0VbnRbSLXgIQygLxLo3BK1vi1kYK/sx2p6
         TBF0DjCbgVLat0rUkBYr3HpGuZiECAx8w+BJni97UMVdhSq/vn/mM6QYIqtuckVJYCC6
         QTM1ezYNtpRbPXwGtsLjEom4vp8Wkhk5mVmlr9vwYRTbECn62ODk3aRuwBY6jO41qNot
         u2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780289694; x=1780894494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m8WkJ7GreGQcFtxECvVXSjHYEmfBxLt7EkdnmdGvJ1Q=;
        b=LoKmGF6FF+TYxLq5D4MnOSsZLEPqTuNRrfW08pR8JybI+Q5g6XmHTYzhj3lijiRxCf
         lPKGyt+NHogG9nnhausBwietBcXBlxPEWcOMJLcqzGmJr94mFEJgLHz32biahvZcyEhW
         7nld8oTD3daEsssb61JD/o7ANNbZEvrEsdTyEKPZ9KDRlz5PcjAzsx2il9JK+Be93Xzl
         vXGMFWThyfYARkodjyarXCZjPFhHGzMUUrMpC+em9hAxk+pBLcu558MmGqN/sdnzKTxY
         ygyLvsHgKBrRPvUyQLaEFzFczerWwmWohyh4ctAHzy7lYzf2u2GHVHM2C68zr5thb4uI
         mwbQ==
X-Forwarded-Encrypted: i=1; AFNElJ95XbdHWu8Ci8HKfBxntjrOOIlvMhDt+4GXviwzYsMzchxxjUbSUx/tYVTfLuK05nfA9uGVzetcOzs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxLr0J602caKbcbcWomYjatrpsD2zsuVeOl4es6xvMbxMZOoWN
	us3rSyydR+LNHTi4pco5QSS39Uvb211W2bQ6LDfI29MLcXLGSCGUHuypaCJLuB+OuJzBNmgPEuk
	UX7wG3HQLukivQk8iYPzP5azeeVlZCxjwIjBt4Lo9vg==
X-Gm-Gg: Acq92OGiag7z6MA2C0W1Jl2wNgRPSjvmOb1h+x12BWpzlHwA34nkl1JSRTAJ1RFkoLq
	Gd1qL/UUtUOswuhff6HmP3WvUrDux+M5BrjDADkED8O4w0OGlUeWXcllql0QhF0YvewZCC7lPoJ
	5n9fUXYVc/YxlH5qo5/LgZo/JlQHiUhc+alcQZgJm6w62lBZm0FRnNj+f3L4asFZfrw9zM1hJBR
	kUSIyzhDACZIgxp6qHAX7b+L+K8yLRNt30dHu0O8MQNVyOsgaJ3b8P1/bvAuPJX8pfQp2CzaH4T
	g3LLedvwEJ+vyCojbvw4ILLvDMkGJfn9UF8xS8UCHs568fXaHV/2SsKgsf4l/ybdksGij+GyvY/
	jOP+3uTCulNPtanYwAWisi6fJjWM/SqAlCmQ7pQ==
X-Received: by 2002:a05:6820:308c:b0:69d:f8c2:387 with SMTP id
 006d021491bc7-69e102bc05cmr4846144eaf.17.1780289693742; Sun, 31 May 2026
 21:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260416091805.56250-1-cuitao@kylinos.cn>
In-Reply-To: <20260416091805.56250-1-cuitao@kylinos.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 10:24:41 +0530
X-Gm-Features: AVHnY4KcQMZz8DLJlvcNE2Bfe9v0l8NEJ4PnGoX_sb1Xpx3LC-P2ExWNiDGt8rs
Message-ID: <CAAhSdy0yBvLumqsO1gn_yjPmjLzNSPdyTRJY7eBSoCFvaPg4hg@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: mmu: fix unlocked gstage unmap in kvm_unmap_gfn_range
To: cuitao <cuitao@kylinos.cn>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm-riscv@lists.infradead.org, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_215455_450890_E02658F5 
X-CRM114-Status: GOOD (  16.28  )
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

T24gVGh1LCBBcHIgMTYsIDIwMjYgYXQgMjo0OeKAr1BNIGN1aXRhbyA8Y3VpdGFvQGt5bGlub3Mu
Y24+IHdyb3RlOgo+Cj4gV2hlbiBzcGluX3RyeWxvY2sgZmFpbHMgaW4ga3ZtX3VubWFwX2dmbl9y
YW5nZSgpLCB0aGUgY29kZSBzdGlsbAo+IHByb2NlZWRzIHRvIGNhbGwga3ZtX3Jpc2N2X2dzdGFn
ZV91bm1hcF9yYW5nZSgpIHdpdGhvdXQgaG9sZGluZwo+IGt2bS0+bW11X2xvY2ssIHdoaWNoIHJh
Y2VzIHdpdGggY29uY3VycmVudCBwYWdlIHRhYmxlIG1vZGlmaWNhdGlvbnMuCj4KPiBTa2lwIHRo
ZSB1bm1hcCBhbmQgcmV0dXJuIGZhbHNlIG9uIHRyeWxvY2sgZmFpbHVyZSBzbyB0aGUgTU1VIG5v
dGlmaWVyCj4gd2lsbCBmbHVzaCBhbmQgcmV0cnksIG1hdGNoaW5nIHRoZSBwYXR0ZXJuIHVzZWQg
Ynkgb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IGN1aXRhbyA8Y3VpdGFv
QGt5bGlub3MuY24+CgpXZSB3aWxsIGJlIHVzaW5nIG1tdV9sb2NrIGFzIHJ3bG9jay4KKFJlZmVy
LCBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qva3ZtLXJpc2N2L3BhdGNoLzIw
MjYwNTE3MTUzNDI3Ljk0ODg5LTMtdGp5dGltaUAxNjMuY29tLykKClJlZ2FyZHMsCkFudXAKCj4g
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCAwODhkMzNiYTkw
ZWQuLmQzN2NjNzE3ZmRhZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTI0NSw3ICsyNDUsNiBAQCBpbnQga3ZtX2Fy
Y2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwKPiAgYm9vbCBrdm1fdW5t
YXBfZ2ZuX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdl
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZSBnc3RhZ2U7Cj4gLSAgICAgICBib29s
IG1tdV9sb2NrZWQ7Cj4KPiAgICAgICAgIGlmICgha3ZtLT5hcmNoLnBnZCkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+IEBAIC0yNTQsMTIgKzI1MywxMyBAQCBib29sIGt2bV91bm1h
cF9nZm5fcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2Up
Cj4gICAgICAgICBnc3RhZ2UuZmxhZ3MgPSAwOwo+ICAgICAgICAgZ3N0YWdlLnZtaWQgPSBSRUFE
X09OQ0Uoa3ZtLT5hcmNoLnZtaWQudm1pZCk7Cj4gICAgICAgICBnc3RhZ2UucGdkID0ga3ZtLT5h
cmNoLnBnZDsKPiAtICAgICAgIG1tdV9sb2NrZWQgPSBzcGluX3RyeWxvY2soJmt2bS0+bW11X2xv
Y2spOwo+ICsgICAgICAgaWYgKCFzcGluX3RyeWxvY2soJmt2bS0+bW11X2xvY2spKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV91
bm1hcF9yYW5nZSgmZ3N0YWdlLCByYW5nZS0+c3RhcnQgPDwgUEFHRV9TSElGVCwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHJhbmdlLT5lbmQgLSByYW5nZS0+c3RhcnQp
IDw8IFBBR0VfU0hJRlQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJh
bmdlLT5tYXlfYmxvY2spOwo+IC0gICAgICAgaWYgKG1tdV9sb2NrZWQpCj4gLSAgICAgICAgICAg
ICAgIHNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiArICAgICAgIHNwaW5fdW5sb2NrKCZr
dm0tPm1tdV9sb2NrKTsKPiAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgfQo+Cj4gLS0KPiAyLjQz
LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
