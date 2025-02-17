Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957FFC021A7
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjtKW2LD6t4lPiUflvocp5wSNv0yp09ISSXk9W42U8I=; b=k5u5yRMIfh6Rdo
	uNKm/ya3QNJu93jdArWjVOVXy8pJ7cHWLn3gLqD1UAzlGSyZX3hDD+vnOwEAp2TAchFmb+I6022In
	mxQJvR2tJRMM4DiL2plNc/JzAlbGEjZ9LeESEJ+65po2iQXUwoxRrGq2DvbgaITVpSUxxatA05TVp
	/vrCIN2kyJQF+izemwVZCjJqfVcOoeC8tkGIQ/pWG55oyh1EYgH2/7xZ1UJFUtqvnYSaLT/x4byFH
	UsqY60DfsIwo9WadFqcLOP9hY96fz5qbzvS3xg5fkihtPaH1egHKvPDhnIY4Cb2a03UjzEQiOkZAI
	UlJC3a1RCgDMjsIdDQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylq-00000004CpZ-0Sb7;
	Mon, 17 Feb 2025 10:54:38 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjybU-000000049Pb-2hJu
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 10:43:58 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d284b9734fso17993205ab.2
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Feb 2025 02:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739789035; x=1740393835; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2V99WRo5v5Q3MzOC1ebd9Y57LboqQs5ifLF7qebM8M=;
        b=gQyOadUtjjjGGfIQrVIRufeqH5io2RvT5GyNT8pTj4zQjiK8+QcgdyfQbWaXHnILup
         4idbvyD7k/1UDd7fRxh01mjURp36sGDRTzl+PM77hwrpsXV2Q8SQeFSqWA+Xklt33A5h
         HIPMjZN0Rod6jE8A+lyyKhkpsEZihJHRs7umIa/y+SdqmBcD3LBryQXdYsJ4CejlbK6j
         N5RsXyp2LKfuWptS1GKUKqwpLLJ3I9kODz1YFXwn0GVF5d+FVFG2GhvMJ67Tu3fEcZvu
         9p9Ypv662muxxxyP+dZyo5HcR51uktchFHgu8uE3vvBptiBu0e4ypgXwq484x4onuwlI
         Zqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789035; x=1740393835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2V99WRo5v5Q3MzOC1ebd9Y57LboqQs5ifLF7qebM8M=;
        b=ZEpudJziwcIU5pZr0vUPxNJZioVwERfP3Vf/COuBHVDK2VpibstQaKbGCzlczNuXUM
         QPvxOGq/4AehS5P+Bbgim45251QyTfY+u6rq6bja0pth+Bhx4DPDxXQCx3DqYwckefpY
         GEpk6CwrOzA7fV6qlzdPqrkNctmsj78cUv8LGrNPzcQgAHyev3/5l2L6Gg+hCplCLONX
         AJ+nmcMmMFNNIguNUFDpTE9LjKxWIRa2Tj0gCHo19bNpaSfujoQ2rv2vK9y8R5z+bPPV
         M+cn3ZQkFaL0toCgJRYukUgcWnrRopGe5Tljn4T19ErwGYPn6cIvbix6J0c5/LsPkiXB
         ihXA==
X-Forwarded-Encrypted: i=1; AJvYcCWGie4lk/lQpmdwxysaNVF6bvAExwXgfQZN0i0VGa0XzjdwfU4GOHIH+DCdHQ0oF5Yswr0o1/mWMXA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyoYR2DqslLPC+OXMttkRSJKK6Z1JPi08gv5fVmxc4ONglkRyGh
	cPwWzK6RY3k4rgWKwPrfpsJexjcU7uglbRI/Zwl2p93HnLhhSN1KVscxnpXv7LHYjWaMd6igm7o
	zMcRG5RjDG2fEmhawW29TTmyfkDrKplbNaY5jJw==
X-Gm-Gg: ASbGncv3L1qhIUbmj5TzE1uv4ghs17uKBV/+Xc5qJ/7YDCUR4I15e9TY0CFfv77cUuW
	PFnOCL8nPtjD35SrlA2g8WHq7jjaZvPrCyrFHuB1Ka3jK8YafxI1FiybN/brf98iVOVLXagx1qQ
	==
X-Google-Smtp-Source: AGHT+IHJJbyqVqnP4ZBh9F+JcrnyLgJr4c9SSZEBg9w0f79c3TFGGpdX5idQXZEwUkQrhZCz3XZ7Xbwuvzc/pn7T5Xg=
X-Received: by 2002:a92:ca4f:0:b0:3d1:9fd0:a898 with SMTP id
 e9e14a558f8ab-3d2807fe646mr61148335ab.6.1739789035598; Mon, 17 Feb 2025
 02:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com> <20250217084506.18763-10-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-10-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Feb 2025 16:13:44 +0530
X-Gm-Features: AWEUYZm5Tu9EOU6io4oCKCd5uKf8WCJJPGpCQR8aWoZNoElVhT-bBEGNz1aiL1E
Message-ID: <CAAhSdy0SScanoz9Q_dm9YBP3bkoGGnM5AXGVWhtUrMcUZ9_=Nw@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: KVM: Fix SBI IPI error generation
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_024356_674073_99E0AF0D 
X-CRM114-Status: GOOD (  18.09  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2hlbiBhbiBpbnZhbGlkIGZ1bmN0aW9uIElEIG9m
IGFuIFNCSSBleHRlbnNpb24gaXMgdXNlZCB3ZSBzaG91bGQKPiByZXR1cm4gbm90LXN1cHBvcnRl
ZCwgbm90IGludmFsaWQtcGFyYW0uIEFsc28sIHdoZW4gd2Ugc2VlIHRoYXQgYXQKPiBsZWFzdCBv
bmUgaGFydGlkIGNvbnN0cnVjdGVkIGZyb20gdGhlIGJhc2UgYW5kIG1hc2sgcGFyYW1ldGVycyBp
cwo+IGludmFsaWQsIHRoZW4gd2Ugc2hvdWxkIHJldHVybiBpbnZhbGlkLXBhcmFtLiBGaW5hbGx5
LCByYXRoZXIgdGhhbgo+IHJlbHlpbmcgb24gb3ZlcmZsb3dpbmcgYSBsZWZ0IHNoaWZ0IHRvIHJl
c3VsdCBpbiB6ZXJvIGFuZCB0aGVuIHVzaW5nCj4gdGhhdCB6ZXJvIGluIGEgY29uZGl0aW9uIHdo
aWNoIFtjb3JyZWN0bHldIHNraXBzIHNlbmRpbmcgYW4gSVBJIChidXQKPiBsb29wcyB1bm5lY2Vz
c2FyaWx5KSwgZXhwbGljaXRseSBjaGVjayBmb3Igb3ZlcmZsb3cgYW5kIGV4aXQgdGhlIGxvb3AK
PiBpbW1lZGlhdGVseS4KPgo+IEZpeGVzOiA1Zjg2MmRmNTU4NWMgKCJSSVNDLVY6IEtWTTogQWRk
IHYwLjEgcmVwbGFjZW1lbnQgU0JJIGV4dGVuc2lvbnMgZGVmaW5lZCBpbiB2MC4yIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywK
QW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jIHwgMTMgKysr
KysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9yZXBsYWNlLmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9yZXBsYWNlLmMKPiBpbmRleCA5YzJhYjNkZmE5M2Eu
Ljc0ZTNhMzhjNmEyOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9yZXBs
YWNlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9yZXBsYWNlLmMKPiBAQCAtNTEs
OSArNTEsMTAgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9pcGlfaGFuZGxlcihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICAgICAgICBzdHJ1Y3Qga3ZtX2Nw
dV9jb250ZXh0ICpjcCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4gICAgICAgICB1bnNp
Z25lZCBsb25nIGhtYXNrID0gY3AtPmEwOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBoYmFzZSA9
IGNwLT5hMTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgaGFydF9iaXQgPSAwLCBzZW50bWFzayA9
IDA7Cj4KPiAgICAgICAgIGlmIChjcC0+YTYgIT0gU0JJX0VYVF9JUElfU0VORF9JUEkpIHsKPiAt
ICAgICAgICAgICAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsK
PiArICAgICAgICAgICAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfTk9UX1NVUFBPUlRF
RDsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4KPiBAQCAtNjIsMTUg
KzYzLDIzIEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfaXBpX2hhbmRsZXIoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgICAgICAgICBpZiAoaGJh
c2UgIT0gLTFVTCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh0bXAtPnZjcHVfaWQg
PCBoYmFzZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGlmICghKGhtYXNrICYgKDFVTCA8PCAodG1wLT52Y3B1X2lk
IC0gaGJhc2UpKSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGFydF9iaXQgPSB0bXAtPnZj
cHVfaWQgLSBoYmFzZTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoaGFydF9iaXQgPj0g
X19yaXNjdl94bGVuKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBkb25l
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghKGhtYXNrICYgKDFVTCA8PCBoYXJ0X2Jp
dCkpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAgICAg
ICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X3ZjcHVfc2V0X2lu
dGVycnVwdCh0bXAsIElSUV9WU19TT0ZUKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDAp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIHNlbnRt
YXNrIHw9IDFVTCA8PCBoYXJ0X2JpdDsKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVf
cG11X2luY3JfZncodG1wLCBTQklfUE1VX0ZXX0lQSV9SQ1ZEKTsKPiAgICAgICAgIH0KPgo+ICtk
b25lOgo+ICsgICAgICAgaWYgKGhiYXNlICE9IC0xVUwgJiYgKGhtYXNrIF4gc2VudG1hc2spKQo+
ICsgICAgICAgICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFN
Owo+ICsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+IC0tCj4gMi40OC4xCj4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
