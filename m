Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E33C2A062
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzboLkwFKWDHaR/OjyCgiy4pZryz6Pl8f3BRNmoHkng=; b=tn5zb4jEsSO4qv
	N2m7outahyrVyhiJ4yGJNITPOJZDnjTJyaR8cH45X+tflvVKjM/BLYbTACyRRzh86TGUxdn9/6MS/
	/nxGgmqEfWr2a6UwLhwFT02SdkNNlTRktBmHFv2tTY1DcpOBrJbuZxa3NZkS82TALCchiTaQ1VCFZ
	zm4LdAgWJ1TzFKXut0uWAkVQenNHfpmMT7cHOXMldXdAZKhBRSiOQ/wYybHUI2YOn/jjVE/f06+sO
	AHXgMFD6bBa/jDv7f9WSL/sBaY7AbD0caORrJrl8RYOXAyzwWGRKWfrS+vfi6K+KSR8l3QSBEvcAx
	kodoL7z/Uzs5i4/M8YRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcNWH-0000000AEhK-0Dc0;
	Sun, 04 Jan 2026 12:47:41 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcNWD-0000000AEgY-39mY
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 12:47:39 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7c701097a75so7434595a34.3
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 04:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767530856; x=1768135656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBR94AA+E+xBOJnVfHQAl63HlInJovxw9TDKKyfWGlQ=;
        b=dmV6zyThUG1Fq4SYq6PPB34wGwV39mXKAehO504sKoEBzOPqTEBO72bz5W3VrUpMvD
         Fx/FeYNZwjx5dqMKJdnJQDV2FMNw8sfSxBBtekLj1UxPzkRCUZWbn8rALl8LQPC8ql4H
         BMsr5kYdjeNLeKYUCfJDyBcDtDJhZPeOaQgVLHg5z6jRAGkhxhhluGXBssrHCdMwgAwq
         lRPhFq8yLAI/EmSkv3Tpv9y4kENIR2tpySDsYL1gd2NdWe2/HG3NNVRbYSO/g0WW81pp
         W1+KFHKu0Sl9zt17Fi+5uXL27lxirJNEpG2NuhiYcoxWGKAKyd225/fBiyuOPd5BBLER
         FegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767530856; x=1768135656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UBR94AA+E+xBOJnVfHQAl63HlInJovxw9TDKKyfWGlQ=;
        b=tJ1xKVpURGZ0qb1co/3cASVHIl0K44uqHaH+/zvfuAxs9SNUjihT+4FW2b31AVeDiJ
         7xhTNWecAGiTNH5fvXK4CkjIvsVzfjYdQ8kudcpfXs+yML8w5tMw7eP5Z9Qp64glI53P
         8AatOGAok0Nx57K5oSyRVynzanDevpfYNJ3OKlbDIMG9EjdQou12YPBRcfHMT+W5GItd
         5Hvx5nv2nx3FylbTAAY2DMFMQeXRy5SLRpAQ8fKZBZV6DK7HO5EG3jftztuNqTl/dARp
         XaQ67uMjy9XzIszLiOuCoA4JctdkCoZtfZJSgC9k/uRtPTFkZcTB3UGmsTM/P/snuwT8
         CbDw==
X-Forwarded-Encrypted: i=1; AJvYcCXugsSkHkvrCG2K5MpAw82p0yroyw/RmxBDFvV9qGLVPS/pUn3nJjJVTqIYsuhdlXmw8U70sjnyr9o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfeuklRbAm5MlbKiBZKUy1L1SNrASL79/himjJce+AUi1hGdLK
	CMF9qKgpYhw3hClqKtxZrY7NyJyLq2pmqyR7rlknr8gpBVEDVOlO4BJBWZrys8XPjKnd9HiYToc
	obzYr6XcJIXjvaRW8699e6maCnoT0RYcGuUCiDammLA==
X-Gm-Gg: AY/fxX77/Um01+la87okOgnJpH0tpaie+EyylysmGqQl3mrS8L/NETBKWu4BFrPSHtg
	vDla/z/NfUkJjQ+tjykrZl4bAYwr2gR6AJWe42Z7CV/2yuwFKnDnPwu9Wod5VBfBXboghqId2ix
	OJ9qwFSQSQ4bg6Wx1TAJZkwXg4v/y+VVMLmd3ZoUpRfuyicr40mDd2fkMojLiQJSa77RA07FIQn
	g4gaihAUTDHZ4sOPTpe0ianuus4d9BUgeephRYcwOXbGTdT3eamXNyCCETkeqdANxYzyXWIdHU5
	41jixN64XCI5eDhKc7lZrQuxDDJU3hV1477mSX9eHOY0xxRyxyIrr6xH9g==
X-Google-Smtp-Source: AGHT+IECPen7zcw66duYFJVMDMXNIgOGjSV9WYBIHgME1nUXUInP9aO+nmllavOhiMWoxzZo2zi2xGJh9M2MH0LN4iA=
X-Received: by 2002:a4a:ead6:0:b0:65d:163:3f3 with SMTP id 006d021491bc7-65d0eac5c3cmr17185222eaf.56.1767530855865;
 Sun, 04 Jan 2026 04:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20251229072530.3075496-1-maqianga@uniontech.com>
In-Reply-To: <20251229072530.3075496-1-maqianga@uniontech.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Jan 2026 18:17:24 +0530
X-Gm-Features: AQt7F2oslKyeGGWLcGF1wus_STNTXspuscmibPNIQSPFMw_t6obj9SIrjq9AInM
Message-ID: <CAAhSdy25eSUF1w5cUzT0N0seYuLEVz66k89SQK=Qu+4gZKtURQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove unnecessary 'ret' assignments
To: Qiang Ma <maqianga@uniontech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_044738_044860_B4550CD8 
X-CRM114-Status: GOOD (  16.01  )
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

T24gTW9uLCBEZWMgMjksIDIwMjUgYXQgMTI6NTbigK9QTSBRaWFuZyBNYSA8bWFxaWFuZ2FAdW5p
b250ZWNoLmNvbT4gd3JvdGU6Cj4KPiBJZiB0aGUgcHJvZ3JhbSBjYW4gZXhlY3V0ZSB1cCB0byB0
aGlzIHBvaW50LCBpbmRpY2F0aW5nIHRoYXQKPiBrdm1fdmNwdV93cml0ZV9ndWVzdCgpIHJldHVy
bnMgMCwgYW5kIHRoZSBhY3R1YWwgdmFsdWUgb2YKPiBTQklfU1VDQ0VTUyBpcyBhbHNvIDAuIEF0
IHRoaXMgdGltZSwgcmV0IGRvZXMgbm90IG5lZWQgdG8gYmUKPiBhc3NpZ25lZCBhIHZhbHVlIG9m
IDAuCj4KPiBGaXhlczogZTMwOWZkMTEzYjlmICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBnZXQg
ZXZlbnQgaW5mbyBmdW5jdGlvbiIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBRaWFuZyBNYSA8bWFxaWFu
Z2FAdW5pb250ZWNoLmNvbT4KClNpbXBsaWZpZWQgY29tbWl0IGRlc2NyaXB0aW9uIGFuZCBxdWV1
ZWQgaXQgZm9yIExpbnV4LTYuMTkgZml4ZXMuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9wbXUuYyB8IDUgKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gaW5kZXggYTJmYWU3MGVlMTc0Li40ZDhkNWU5
YWE1M2QgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAtNDk0LDEyICs0OTQsOSBAQCBpbnQga3ZtX3Jp
c2N2X3ZjcHVfcG11X2V2ZW50X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBs
b25nIHNhZGRyX2xvdwo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBrdm1fdmNwdV93cml0
ZV9ndWVzdCh2Y3B1LCBzaG1lbSwgZWluZm8sIHNobWVtX3NpemUpOwo+IC0gICAgICAgaWYgKHJl
dCkgewo+ICsgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0ID0gU0JJX0VSUl9J
TlZBTElEX0FERFJFU1M7Cj4gLSAgICAgICAgICAgICAgIGdvdG8gZnJlZV9tZW07Cj4gLSAgICAg
ICB9Cj4KPiAtICAgICAgIHJldCA9IDA7Cj4gIGZyZWVfbWVtOgo+ICAgICAgICAga2ZyZWUoZWlu
Zm8pOwo+ICBvdXQ6Cj4gLS0KPiAyLjIwLjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
