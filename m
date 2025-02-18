Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6575C021AA
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zYtntPPgMokIhR6yBGaaU3Jp8ROpmgk9gw0VZI6P2M=; b=qYqU9QqtrA3pYS
	6KvN6Z+Olu5ohxe8ywtPEj8X90ThJR+tY8uim0HIiNWgrc3nMZo4ImgSHLxp5CqeOjcL9QUNNKXTs
	2zmtJxTlFS3tx+yVRCnz/HF5q1LjrtfqIlYeioaRElpVRE9kq/+DdU2D8t5/ke9YHAgZ1SSIuNnlO
	KJvEbQt+DM45K4IDiEOfw52SbYQf5tTEXs94MNrrXCsG7Jp4NYoSTtjIOcfOSlC6iiAtilHCLd6cB
	7qW+n8f1cch8GtyW1w1sV3Ex+WReuW4IcVHyY0Gd83TJeBhbViNeClnDY/pkKC1hfx3kKMaE8WKix
	j1JBftJ9ZsvtmOYVJtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRjB-00000009EYc-1XnZ;
	Tue, 18 Feb 2025 17:49:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRi8-00000009EQi-2bwU
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 17:48:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38f2cb1ba55so3439667f8f.3
        for <kvm-riscv@lists.infradead.org>; Tue, 18 Feb 2025 09:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739900922; x=1740505722; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y/9F2KANNnqRPhOVip+6sGGo7ED+K7ta4GpssYl+9ok=;
        b=UocG4U1CQmWurAwyeIM9BVb4K4m3a8R/a6GoUJZuKxwOQq/o/wNO6r8RRLfFgVo2po
         eXtdfwyOTP0ClxG5XxCAUw/W8rZoUtBDlTDZ4uHKMzJhqH2Lg5Psg54EFLMo5fGet/I6
         eFc/lXLCyGKnKjsGWgdjEaFMOn9ptzf8T1bUZWTs3uHh7a9hKvJgFHVlXkYgbcAR9FLn
         rOExh4UFk/KNqSonGTExNSkEzQuQ4hhAosGh/M2z0U0FhNjUfsxhlE5DZEnSyTCXvGJS
         LyF5kWQ/1jUec+O3ZVEgsOxs8pmdlnWh9abzP4ObJ1Av/pLANY+nmbbFYF5MGwW2otay
         skbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739900922; x=1740505722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/9F2KANNnqRPhOVip+6sGGo7ED+K7ta4GpssYl+9ok=;
        b=Yxhn4q0H2096BgvI6th0+6SVXSEThFr69TaFD8yVubJeWqCtEd32hkEGFP1xc/vkdV
         mcz4yGCAGERz0EdQl4yaXdo8L8+d/sxloL0HyDtT2RmsTp8ZKwNfENb/L/tTJB+kGP3N
         Xa2JMQ3JTztHx5bx9vIiX+EfCG5tePyi90eRP6B/XFt5NnW9/UTCi5t5qvA2Zm6tfUHZ
         FinSM/pbYRtOMvB2qH3loFrmA99zNcbcGuWkQ8dELd7iR9vcDwbLn7crVCcfow43ruMP
         FVxAqrcfodyBTvtHUPwGSvuqX/PlQMN7tlPiM5SYhpW+reEmC+5CyEKdHEmE7DPFCs9J
         EwOA==
X-Gm-Message-State: AOJu0YxV2JMOvc6hmPnYu+8m1oSpx85+dT8x3X3DENeLb93tOag4dTL5
	O/CRoJfyv4LutpWMVxqIwnkZ0BSH+uoGGuuzliYro7XTDoxORfJN1DlEGRRmqW8=
X-Gm-Gg: ASbGnct7p8ntyniQdNjQEoEFa4E+feJ7HcGQ5NKCqQaBLsv08RY6rpOUhMRlaV8MEa9
	R2JowQQzU+3CASt8k01KszMBBUSJ4v+tjd65MV8mwIgBO5QhquWdcvByNL/5+91B81DsaapdJGM
	E8Xn0pjTHP94aoY6dOSC+E3fpW7ifn9SE6zc4LOgrn/gztVIaBVAuwdP8yxVU9G8wC+boLpasfl
	jmn+w679dVt9J5umXr+LA8yAr+lgbiNeLL6mY0Dl2iOVQKIRMufRaO0AkW5QquTTx6Pu4Oo2V7Z
	Jbw=
X-Google-Smtp-Source: AGHT+IGDVdEGfqSSRSuokSOsRD/Nb4bUupeEDDpkXhWkKSM85eFfn/T5hKxjkCf6oi4D/15usSNtVA==
X-Received: by 2002:a5d:6c68:0:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-38f58795a45mr438523f8f.27.1739900922377;
        Tue, 18 Feb 2025 09:48:42 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dcc45sm15720336f8f.33.2025.02.18.09.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:48:41 -0800 (PST)
Date: Tue, 18 Feb 2025 18:48:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?6aG55paH5oiQ?= <xiangwencheng@lanxincomputing.com>
Cc: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"anup@brainfault.org" <anup@brainfault.org>, "atishp@atishpatra.org" <atishp@atishpatra.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
Message-ID: <20250218-57a3a16e477f83a8c267d120@orel>
References: <38cc241c40a8ef2775e304d366bcd07df733ecf0.1d66512d.85e4.41a5.8cf7.4c1fdb05d775@feishu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38cc241c40a8ef2775e304d366bcd07df733ecf0.1d66512d.85e4.41a5.8cf7.4c1fdb05d775@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_094844_666225_8B716A03 
X-CRM114-Status: GOOD (  25.20  )
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

T24gVHVlLCBGZWIgMTgsIDIwMjUgYXQgMDQ6MDA6MjRQTSArMDgwMCwg6aG55paH5oiQIHdyb3Rl
Ogo+IEZyb20gMzBkZDAwZjY4ODYxMTllY2M1YzM5YjZiODhmODYxN2E1N2U1OThmYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBCaWxsWGlhbmcgPHhpYW5nd2VuY2hlbmdAbGFueGlu
Y29tcHV0aW5nLmNvbT4KPiBEYXRlOiBUdWUsIDE4IEZlYiAyMDI1IDE1OjQ1OjUyICswODAwCj4g
U3ViamVjdDogW1BBVENIXSByaXNjdjogS1ZNOiBSZW1vdmUgdW5uZWNlc3NhcnkgdmNwdSBraWNr
Cj4gCj4gSGVsbG8gZXZlcnlvbmUsCj4gSSdtIHdvbmRlcmluZyB3aGV0aGVyIGl0J3MgbmVjZXNz
YXJ5IHRvIGtpY2sgdGhlIHZpcnR1YWwgaGFydAo+IGFmdGVyIHdyaXRpbmcgdG8gdGhlIHZzZmls
ZSBvZiBJTVNJQy4KPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIHdyaXRpbmcgdG8gdGhlIHZzZmls
ZSBzaG91bGQgZGlyZWN0bHkKPiBmb3J3YXJkIHRoZSBpbnRlcnJ1cHQgYXMgTVNJIHRvIHRoZSB2
aXJ0dWFsIGhhcnQuIFRoaXMgbWVhbnMgdGhhdAo+IGFuIGFkZGl0aW9uYWwga2ljayBzaG91bGQg
bm90IGJlIG5lY2Vzc2FyeSwgYXMgaXQgd291bGQgY2F1c2UgdGhlCj4gdkNQVSB0byBleGl0IHVu
bmVjZXNzYXJpbHkgYW5kIHBvdGVudGlhbGx5IGRlZ3JhZGUgcGVyZm9ybWFuY2UuCj4gSSd2ZSB0
ZXN0ZWQgdGhpcyBiZWhhdmlvciBpbiBRRU1VLCBhbmQgaXQgc2VlbXMgdG8gd29yayBwZXJmZWN0
bHkKPiBmaW5lIHdpdGhvdXQgdGhlIGV4dHJhIGtpY2suCj4gV291bGQgYXBwcmVjaWF0ZSBhbnkg
aW5zaWdodHMgb3IgY29uZmlybWF0aW9uIG9uIHRoaXMhCj4gQmVzdCByZWdhcmRzLgoKVGhlIGFi
b3ZlIHNob3VsZCBiZSBpbiBhIGNvdmVyIGxldHRlciBzbyB0aGUgY29tbWl0IG1lc3NhZ2UgY2Fu
CmJlIHdyaXR0ZW4gZm9sbG93aW5nIHRoZSBndWlkZWxpbmVzIG9mIFsxXQoKWzFdIERvY3VtZW50
YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0Cgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEJpbGxYaWFuZyA8eGlhbmd3ZW5jaGVuZ0BsYW54aW5jb21wdXRpbmcuY29tPgo+IC0tLQo+IMKg
YXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCAxIC0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIv
YXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBpbmRleCBhODA4NWNkODIxNWUuLjI5ZWY5YzIx
MzNhOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTk3NCw3ICs5NzQsNiBAQCBpbnQga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gCj4gwqDC
oCDCoCDCoMKgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+PSAwKSB7Cj4gwqDCoCDCoCDCoCDCoCDC
oCDCoCDCoMKgIHdyaXRlbChpaWQsIGltc2ljLT52c2ZpbGVfdmEgKyBJTVNJQ19NTUlPX1NFVElQ
TlVNX0xFKTsKPiAtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGt2bV92Y3B1X2tpY2sodmNwdSk7CgpX
ZSBjYW4ndCBjb21wbGV0ZWx5IHJlbW92ZSB0aGUga2ljaywgYnV0IHdlIGNvdWxkIHJlcGxhY2Ug
aXQgd2l0aCBhCmt2bV92Y3B1X3dha2VfdXAoKS4KClRoZXJlJ3MgYWxzbyBhIGtpY2sgaW4ga3Zt
X3Jpc2N2X3ZjcHVfdnN0aW1lcl9leHBpcmVkKCkgd2hpY2ggY291bGQgYmUgYQprdm1fdmNwdV93
YWtlX3VwKCkgd2hlbiBoaWRlbGVnIGhhcyBJUlFfVlNfVElNRVIgc2V0ICh3aGljaCBpdCBjdXJy
ZW50bHkKYWx3YXlzIGRvZXMpLgoKVGhhbmtzLApkcmV3Cgo+IMKgwqAgwqAgwqDCoCB9IGVsc2Ug
ewo+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCBlaXggPSAmaW1zaWMtPnN3ZmlsZS0+ZWl4W2lp
ZCAvIEJJVFNfUEVSX1RZUEUodTY0KV07Cj4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIHNldF9i
aXQoaWlkICYgKEJJVFNfUEVSX1RZUEUodTY0KSAtIDEpLCBlaXgtPmVpcCk7Cj4gLS0KPiAyLjQ2
LjIKPiAKPiAtLSAKPiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4ga3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
