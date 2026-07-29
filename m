Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA87FC53219
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6buF7iiz9P/C/JbrrPLV2IlKC/4vnTLJKRwhfco/Fs=; b=q3L66QlWAAL84p
	btwE0Z7nE0lPfXIsKWxsNFY8uQ5J54WmGiChc5V6NTEiYGudGIWqE67kDs03EV+W9hBygh3IV2KOB
	UvLt1uMN+K7cssD7Kp86uddR2VuE3K2RKNNd6Rr0cmeK96VE+3djUpAlSPvRQKUsNO5O70wVVu6VO
	FPYWUyNZnMwAdbDqNpEwTEGwYxj6ONbAJH23AREVGaywF/90jIPzgxnbPoNbeuIOccpBxZx3ZrDRY
	RIQ5McdTynsLCmOTtnLjvRVVL93eHtXveQNjm4WrR2YG3xi9jKYAC5ksiuWMYyhN8tKl2CaqefGXH
	9PUFSFTLeWiwtLdb8iaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7iu-00000008e7c-3LU9;
	Wed, 29 Jul 2026 17:05:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7it-00000008e6y-0nS5
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 17:05:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso832781f8f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 10:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785344737; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcZR5Er8mXS5ZQGKWCDFwv7Ms8CMuGoJylK8WcyI9IvzTCh14qqeeuAu7rVvuH1b2X
         d2bQ+RMe1YV2mFuDabqOJNkXxGYdm3tSwHh4yHq5tRlgagoctEXfbtWsodKfhLpcHUm0
         hnpGH11QpoJBC/eBNCM+QfxmEYkBdYudn6lmqWvkn1X0M5a/9OnF7cO90Lywl+09VQD9
         EGIoz2wYa+Bn2eE8nlsN95vnHX3k8X7sLTr3hu2v93tUs6JPKpfafSKtNVg57QQN0qG9
         AyUIW8IusMW7l/Mkyhs4g+dZYzczPIxjUEZVshkMyIWyyvv3oUVT4HH+63CKUCy5oRXU
         XNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dMtP5Omajqf4t0e1+zEGN1nUMmV4lfG68xLAZ3F1QR0=;
        fh=11bFGXceiQoCTw3VOdZA5c+ORZi9uuaWylbkcUaM/ik=;
        b=Nun5m4G3ggZKhCjctK8EzFB6MOlOph9dTVa7rz0fTCPcY5eg0wBHRKcGL3J7UY4hTQ
         on2m9u9zBkRuqO+7R4KnmdpHguXpbN2RnHVupHbp86SnbX9uIKskBFFlIyWyMAjKyEro
         ecMtWqukTa0cwQErbG1k5NTPb58wlOHTjPmcJ3P0fuTNt8EtFRfw8s8+thjbpkOzVQwL
         0kZZAqBA6vkc4D8QNdYwluQ28wVO5a690yuA2/C8r5SE3lYF31WT6MiJ/Sw8F8QIAZ7C
         ksDfEG1JTbxOcsW5Sqden1yJmizHSDpqqso5Wtar+LyDfVV5K7+4fdhVUKpTkdxJlrT/
         IPGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785344737; x=1785949537; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMtP5Omajqf4t0e1+zEGN1nUMmV4lfG68xLAZ3F1QR0=;
        b=Q27SFv8hPXWEUWf1qUymeIX+y3mdPOQWaNd/i5ShZ53iY3jbR80ueGAmD9RTJPdmvI
         4PHO0TKjOmMKSeeTJxxxnFhyAP9FQTvK7SKNTaZ0wQkTcbGfAHzK346M5JqkQuQga52p
         Ex6ZMFuouJHM3NjUMfm3cwye8vdJ819aboJO7Rs76A77rHl57ASO1J8GgBv07rBoq1Lg
         /k0kolId6ue18UD+uScbwbHabE7tZfho1hecYO+xu7bkmI4vuiShk/YwY8NBuXUNh5Lh
         InoKi/qQ++WtnOttSFH42Wcvl7je7t5nHoRJsfr7Q+WGgKyuEuh9cROZVl5jW/ftolLo
         GVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785344737; x=1785949537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMtP5Omajqf4t0e1+zEGN1nUMmV4lfG68xLAZ3F1QR0=;
        b=ktn+HOTVNSBhGryIcP/Zae8W0vvyl2V5rdLoaE16Ky8XA7lHuu3jYc5B2p2PljUBYV
         KJSIskMjw7oinYcbb8n9eANcw3UrhEFMDcXlGsFBG7ufsEHyivsrgJ7IKy+H4wPsyIVl
         tjz/g+aKmehxdNpy3v4nLAWt5yfgemwAPwvo5uWmAvFP7HWDW78GYlD7GgEah6z8P5Hi
         aN43B0yZV07R0wpfxIqV+40ReNX1aTN/b4ovrTe4pbYuf2aRMYDev4OfzvT1JW5RK2aI
         COXyuuX0SL82pWwPJ/6mZqrYrz2q8VPWb3k0bDhIYU2JopEdcvNR1IO6BWxc9SogH5Yq
         2cHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXNriGi1sboofyy11bM7MB37Wu/JAiBMWt5ESTn31vjDQYYIxqgccgQ+wVpowYl7WZpdBfxyCrIxg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzS1IR4uEtRqr6ZzSKs3t+5cHWKrB6j/LqHRWSaRpZOP5u07W+v
	8hJPwWaPU7JV3npDqB/jm47uf34aehQvqKR2eZhBdLmX0N/4on7NkSUqWRrwgGF25GEEvP472Nu
	U+JUjCL2WXcR7p1ECuUKUqX0knBI2Wwc7GgaHTywSYA==
X-Gm-Gg: AR+sD11zu6mP/Ov2v43d9771wp0jzo+tvRel/xiGuRUK2MyhjWoM/9Z1b7NWoUVDL7H
	O2+Pc+OLKzhwqhwip60Z9rlgebIp3GK/qwB/vk55bPb/IwQuP9rKKBL3o1gdBdXOKLcuWDaeGTb
	ZmGwcU/yUzOei04Ce2cUAYotkhHWuDtniz5WRVpL9CW4ONPjD+i9MIyScQUxSdJs+f8VfABcShV
	TPhEgpDZ1RhIItun0CPFt1hKvX7s4whT+HkQ3cJakGLJJxD65+/GocMCf17RElWSBiJiDh5/Lqm
	EY1sMxYMYlVmnpiqmU6mu8tGQ5+HG95JNimqkSioK3ryM08vIilJb8pm4Jd5om9sWpkSX1YagFT
	LY5eZE6lEAFnkWnmChgaycABEmhQAU+aHp5hI3onvqU23yyo90vrns5ZNmOrpN42jGKha1sPYfN
	A=
X-Received: by 2002:a5d:5f53:0:b0:47f:91e3:3cc9 with SMTP id
 ffacd0b85a97d-47fb1ecddc6mr9504645f8f.39.1785344736564; Wed, 29 Jul 2026
 10:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260728141938.95845-1-yang.yicong@picoheart.com>
In-Reply-To: <20260728141938.95845-1-yang.yicong@picoheart.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 22:35:25 +0530
X-Gm-Features: AUfX_mylMRmMHsP9q6CuBjLim_iNkPGTC4Rz3L9UjAHJiq8sx9HavOSQJCr973s
Message-ID: <CAAhSdy16iej14cfBAoU6Xdkadnq8bprU0tb0+rdJK6nX7EOQiQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use try_cmpxchg for IMSIC MRIF RMW
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, geshijian@picoheart.com, 
	shenyang.young@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_100539_253533_6CF7FD43 
X-CRM114-Status: GOOD (  17.92  )
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
aWNvbmcgWWFuZyA8eWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZv
ciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2lt
c2ljLmMgfCAxNSArKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFf
aW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXggZDM4ZjVkZTA4MzRj
Li5jOTIyYzAzNzM0NGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMK
PiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBAIC0yMjAsMTUgKzIyMCwxMiBA
QCBzdGF0aWMgdW5zaWduZWQgbG9uZyBpbXNpY19tcmlmX2F0b21pY19ybXcoc3RydWN0IGltc2lj
X21yaWYgKm1yaWYsCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgb2xkX3ZhbCA9IDAsIHRt
cCA9IDA7Cj4KPiAtICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgKPiAtICAgICAgICAgICAg
ICAgIjA6ICAgICBsci53LmFxICAgJTEsICUwXG4iCj4gLSAgICAgICAgICAgICAgICIgICAgICAg
YW5kICAgICAgICUyLCAlMSwgJTNcbiIKPiAtICAgICAgICAgICAgICAgIiAgICAgICBvciAgICAg
ICAgJTIsICUyLCAlNFxuIgo+IC0gICAgICAgICAgICAgICAiICAgICAgIHNjLncucmwgICAlMiwg
JTIsICUwXG4iCj4gLSAgICAgICAgICAgICAgICIgICAgICAgYm5leiAgICAgICUyLCAwYiIKPiAt
ICAgICAgICAgICAgICAgOiAiK0EiICgqcHRyKSwgIityIiAob2xkX3ZhbCksICIrciIgKHRtcCkK
PiAtICAgICAgICAgICAgICAgOiAiciIgKH53cl9tYXNrKSwgInIiIChuZXdfdmFsICYgd3JfbWFz
aykKPiAtICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cj4gKyAgICAgICBuZXdfdmFsICY9IHdy
X21hc2s7Cj4gKwo+ICsgICAgICAgb2xkX3ZhbCA9IFJFQURfT05DRSgqcHRyKTsKPiArICAgICAg
IGRvIHsKPiArICAgICAgICAgICAgICAgdG1wID0gKG9sZF92YWwgJiB+d3JfbWFzaykgfCBuZXdf
dmFsOwo+ICsgICAgICAgfSB3aGlsZSAoIXRyeV9jbXB4Y2hnKHB0ciwgJm9sZF92YWwsIHRtcCkp
Owo+Cj4gICAgICAgICByZXR1cm4gb2xkX3ZhbDsKPiAgfQo+IC0tCj4gMi41MC4xIChBcHBsZSBH
aXQtMTU1KQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
