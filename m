Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ED9C3ABD8
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 May 2025 21:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EWF4JqWF+MBGKMS2fXVXMkeDJ+SXvVsS7iDmX61XwE=; b=FbnNBDS8zto7g1
	wE7USHNGNFyxmvFu6TxecfCoEqggX48w62hp+1g8A5TVdr3HqVZBMAZRc5FOVmuCm+E7Fh87kFaV6
	p9Wc5QwLjG2GAOxul5uYSNyz+mdf4vs8DHVkYM/i3Ia8EYbQ4XD9lq46Wq1YWXtzaeQfL9Zo7COzB
	uDWGJMPBdJ9lIcZKDp7302jQXeT7QRgIXIxe1pksd43br+AT71mEt1+Bnr0Od0q+h+Zfm91bxWD1g
	qMD0pBMUKA3Av9QbXYpGUl3UOo2dlAOVOhAVWFKSlTClzzuRHWktUeJiB3APrkX5SzcWe9tEEPQNG
	Kcu4mXvUdTWU7aGBid1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJEo-0000000GLBQ-2FFB;
	Wed, 14 May 2025 21:02:02 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJEk-0000000GLAR-3ldf
	for kvm-riscv@lists.infradead.org;
	Wed, 14 May 2025 21:02:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30ab344a1d8so313084a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 14 May 2025 14:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747256518; x=1747861318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqchgTdHTyjs5ScPdT62o65cQnPzkkTwJlrZ4hmq6Bs=;
        b=kEESPvaY7eInDhSnmlQEAK/hRfyiUvkRoe0rC3P7p4WKMGV3cFozyLaolG82RDyoMT
         JHdSDDILCI6fK3/3dZuSC6iVDDSmXhb9djegIFLiL6dtvPhcmgeUBvJYyBhUPxsGe7PL
         IqH+f57bkTj7aqRdvi4mmXzNLqHjpfwWSn3mSuOg7SV9T1uxXM8U2g1yoJOlV+tlXSAU
         sEsi8VQvFCKfyUlgZ1bSe4Gek80fwBtaF9PnJYa4gKsJfo34oKwuwpnd0yDURRmQJTND
         Z3hnv7CBx0gp/Dlz9OgEQt9/HI//IPE1YsXbGrO6YQQOJ8Y5kRn8T+38PhBzhoM6Lhqh
         8KaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747256518; x=1747861318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqchgTdHTyjs5ScPdT62o65cQnPzkkTwJlrZ4hmq6Bs=;
        b=lmk/5JgJtZ4u6qXGdSCygWpKRJjqfiup905p2YbZLPdknY+R0m3gX4wHELBPz0odSh
         RupqNOE4PTNauElHpHsyB4XCMbc8ba2fW/6d7jGYTifDI+NHmCnVzqbVLRt/owrwbkoZ
         FgRI7PjJmerRvzVmPSMeJdtju/F3qEuX4PLDEuowoiPLUlxrc3uTHwPVTYqei5WS8a8F
         Mpa+5KFkZtZJsu5xzLSnAGYbii+8LZqRgysf8OOa6halKlZhP6MkywwnHw/895hRFW5n
         BydzPpplB/KW374KRWgaogKHYup8xAVHjKKTSOVDq0KQgKPhbGNMhIOLaOXLVgxWdpYZ
         7SoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3CYF6l6IeewZcNAnXRbAiRUIj7W9m+1zu9C/W7Fpc8WEftBMAJM3ozeRXLXGdgzbJtEA8CBfQupM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyohI2nGTXHEbntzsvjr4ih2avTj0PF15bzLe2+5VT7sMNEQxPe
	8qSRu4uVid1eFiWNTq7/UUBfZsCgk6wHZtUcUAukA6uHKuHkjo8LQGQBsL/Pu4CVk3oPLCJ/C0/
	RB8QN5uZ4Ey5uFv4EE9qZjUavawm4nPfVulXS2A==
X-Gm-Gg: ASbGncv90z/OByoxHmyanDgzW58tzkRRH4frNk4htJbnCysj4agKjIGL98NBYbTYs7+
	qqR0tSExEIHbeV5yqLML2+/YFnZzH0vscKum1MeV2CXPxBeYjmEksmA91Kk8OOhHcmSqOhPtXK0
	50c5txGKjmdm2TPA2XqUqO0wIz2uukFlw=
X-Google-Smtp-Source: AGHT+IGYtWvln6Vge4DD/b8/a37hqJvAAC7E46KvEmNXhfMJrQcWms3WMqWIhs4CNOJ5GERxgioGT+LfF4aLuzg8mgI=
X-Received: by 2002:a17:90a:d2d0:b0:2ee:f550:3848 with SMTP id
 98e67ed59e1d1-30e2e583ee6mr7135070a91.5.1747256518169; Wed, 14 May 2025
 14:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com> <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com>
In-Reply-To: <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 14 May 2025 14:01:46 -0700
X-Gm-Features: AX0GCFuPU3_CZzMOt6Sp9bohA_uEiLWy733kJmW5xL5q5LKhEWdxzONolY_B8xQ
Message-ID: <CAHBxVyHXJYDWbfY7FAEBB0S0ZG2+ka6KpWpd7+NO9jhApxav5g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_140159_197917_32AAE17D 
X-CRM114-Status: GOOD (  19.89  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMzo1NeKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTI6MTPigK9QTSBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIEtWTSB2
aXJ0dWFsaXplcyBQTVUgaW4gUklTQy1WIGFuZCBkaXNhYmxlcyBhbGwgY291bnRlciBhY2Nlc3Mg
ZXhjZXB0Cj4gPiBUTSBiaXQgYnkgZGVmYXVsdCB2aSBoc3RhdGVlbiBDU1IuIFRoZXJlIGlzIG5v
IGJlbmVmaXQgaW4gZW5hYmxpbmcgQ1kvVE0KPiA+IGJpdHMgaW4gc2NvdW50ZXJlbiBmb3IgdGhl
IGd1ZXN0IHVzZXIgc3BhY2UgYXMgaXQgY2FuJ3QgYmUgcnVuIHdpdGhvdXQKPiA+IGhjb3VudGVy
ZW4gYW55d2F5cy4KPiA+Cj4gPiBBbGxvdyBvbmx5IFRNIGJpdCB3aGljaCBtYXRjaGVzIHRoZSBo
Y291bnRlcmVuIGRlZmF1bHQgc2V0dGluZy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQ
YXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gaW5kZXggNjBkNjg0Yzc2YzU4Li44NzM1OTNiZmU2MTAg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiA+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYwo+ID4gQEAgLTE0Niw4ICsxNDYsOCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9j
cmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ID4gICAgICAgICBpZiAoa3ZtX3Jpc2N2X3Zj
cHVfYWxsb2NfdmVjdG9yX2NvbnRleHQodmNwdSwgY250eCkpCj4gPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9NRU07Cj4gPgo+ID4gLSAgICAgICAvKiBCeSBkZWZhdWx0LCBtYWtlIENZLCBU
TSwgYW5kIElSIGNvdW50ZXJzIGFjY2Vzc2libGUgaW4gVlUgbW9kZSAqLwo+ID4gLSAgICAgICBy
ZXNldF9jc3ItPnNjb3VudGVyZW4gPSAweDc7Cj4gPiArICAgICAgIC8qIEJ5IGRlZmF1bHQsIG9u
bHkgVE0gc2hvdWxkIGJlIGFjY2Vzc2libGUgaW4gVlUgbW9kZSAqLwo+ID4gKyAgICAgICByZXNl
dF9jc3ItPnNjb3VudGVyZW4gPSAweDI7Cj4KPiBMZXQncyByZW1vdmUgdGhpcyBhcyB3ZWxsIGJl
Y2F1c2UgdGhlIExpbnV4IFNCSSBQTVUgZHJpdmVyCj4gZG9lcyBpbml0aWFsaXplIHNjb3VudGVy
ZW4gY29ycmVjdGx5Lgo+CgpCdXQgb3RoZXIgZ3Vlc3RzIG1heSBub3QuIEkgdGhvdWdodCB0aW1l
IHNob3VsZCBiZSBhIGJhc2ljIG9uZSB0aGF0CnNob3VsZCBiZSBhbGxvd2VkIGJ5IGRlZmF1bHQu
Cgo+Cj4gUmVnYXJkcywKPiBBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
