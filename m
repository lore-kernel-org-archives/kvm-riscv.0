Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAD0CCD199
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 22:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KnxYggm9dYixxtqPBilCyJKAy50gv3nf2yHKLwWEqQ=; b=AKxYFex6C5A7qO
	aukG/ZQCV+VC992lCOIu3hRpIntN9LDYqeiroOOYhY5ILUCRcRbcqNVOP0cA8SwHl2XN6LHkE7KcI
	bdvGc531fMKOWRkh/GDBWYK+L6pjAObdNDGqSwASvEK7ThEgbER6zxBFv6fFUCC3kH2qyp/nntULV
	V2+QNIkyGJJeJndP96PxgGXbrzO9Iwhb/btWEqc55NGwLBaK63HZqyYYzZtM4SPzPicpWQY1wFprz
	5cDnoLp9bg2JcZoCTZCPCwE82Z26Ehe047nT5CC6NAmQnbL18BzmtT9xaqbOXNzTefFm+I2MrJAeo
	1CsKxWSZ5gd67QskPI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9t6T-000000098DY-2aIt;
	Fri, 17 Oct 2025 22:39:17 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9t6R-000000098CX-32Js
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 22:39:16 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5818de29d15so2957992e87.2
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760740753; x=1761345553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoqzKQNFCddpnwTwWMxWSsHCHOracpeEvFEON9b+5D0=;
        b=RSNEZMv+B+Pw9n60M6YAQCbXx2XBqc2gPj1nDGQICv7TMBR8dJKUE+/qqzEfbIRBQv
         95R/k4SAaWd2WuhEAhInlA0S/dQFyNihtz8uqA9LxOu7iCw1XL0IfPhAqmb7VzztMQEG
         nhtLd4+WygnMW364oK1EEmKkFu3aG5Nrm8y7iBkD+8pdsJKaFYKz8mhMyLEOrlj8L4MY
         ZLFG6nNNNo3GLZmT5F7aNPqqpNRgvfRzUAJAr/7PqXAlH5fJWUS70Z8iEGU+vbOOYyBa
         d2yEQLcRHRRWZtmJbAFNAiA6QDOLYG7pUhQTPw+sOvv8EL5s/BsDCkFADu0+fJZ6v7XT
         gpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760740753; x=1761345553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoqzKQNFCddpnwTwWMxWSsHCHOracpeEvFEON9b+5D0=;
        b=FkMMvQzCQ+DVPDDtn0fxSl0oocpRG241FuSGcVwcbts8CzBPYQYdAP25i+CauSWz6O
         9BJoRVxZJKrXBQ3T0NR6a0w4vlGJrZtcZHVBjdZqMSMSpkUgBeFFm3+31YmxczlWSdyp
         vFgc+k6b5yZr0+8xQ43CPnl0R/bG22ySd9m6O6a9ajkQ9oSu9ev8328PgvpWD6YuVjPB
         In0vh0DFtdc3BSmM22qcsTJBcSVvD3A/V3iAIBnDXY1vGy1+d0apRi9KLhs2IlYbMgxF
         qX83gFMAA2OcAwW37sMMbVv6Clcb7HcWPUKe67fDZIZeEs1x5W+RcBA1AHzb2bVvyzWt
         t+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWxm0efIwCVFuO8NsG+R4SB1SswWWlk3HRTynIi7CWr9Wq0GZTBpV3v4clMlIi6OcM9vLdG0YfcruQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYCF8xqIPPdND6JqZj8ho23tdqUiZ9ehOIQiAVBZtTbm+UX7p/
	9/R2hQIs/gT0c0UZqM+SSbkK4v5Ivv5IWkn/l4IgaMpTOF3N3L9q06eDSDitu3jyA+h4mhWOB5t
	rCVEAls7cjsk8R7dm5iXtnpStSI9aCB/eW22wUaxr
X-Gm-Gg: ASbGnctdLrf2EoSXMZh1qHDGWLBRJNmWzA2E5zWE0niiDOKyWVZfwwVWi0FV/v7DTDg
	svJIRh6SsIxOiv45d8GLmz23AIyOYcfLBnJgB9X7a8vyLuVRd8drljY/in9Y06auyT0R0Dtr8WU
	3bIa4TRIew7pDZELLt0Yd73zDeRTopXVz2rTVHdIHZNwcm6737hHIyFZIS/1JQ7yqHmzw1wVdZq
	pxwLqSCLAx3IiqA9lf8gPsvH9Ot6wCO5FIdPdpz9JSVET8XIPYNqy12FBcNs0o8H8gROZfq
X-Google-Smtp-Source: AGHT+IHS0n4/1zDhYDG11j/phEtQioVcSLIhzKZxyKRafka2oa60va2EzlIsG9E+0PXvk8E7U9fUvkCXKxOf+kRpoho=
X-Received: by 2002:a05:6512:131d:b0:590:6119:6b73 with SMTP id
 2adb3069b0e04-591d85aa092mr1710058e87.48.1760740752394; Fri, 17 Oct 2025
 15:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
In-Reply-To: <aBPhs39MJz-rt_Ob@google.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 17 Oct 2025 15:38:45 -0700
X-Gm-Features: AS18NWAC2AsnIEyOuBJBf6AwyLhxj7CRd7TcYAURWBeq_wPcJYz0GvazO3M1Rc0
Message-ID: <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_153915_783200_936B897B 
X-CRM114-Status: GOOD (  11.49  )
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

T24gVGh1LCBNYXkgMSwgMjAyNSBhdCAyOjAz4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+IE9uIFRodSwgTWF5IDAxLCAyMDI1LCBEYXZpZCBNYXRs
YWNrIHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgcmVuYW1lcyB0eXBlcyBhY3Jvc3MgYWxsIEtWTSBz
ZWxmdGVzdHMgdG8gbW9yZSBhbGlnbiB3aXRoCj4gPiB0eXBlcyB1c2VkIGluIHRoZSBrZXJuZWw6
Cj4gPgo+ID4gICB2bV92YWRkcl90IC0+IGd2YV90Cj4gPiAgIHZtX3BhZGRyX3QgLT4gZ3BhX3QK
Pgo+IDEwMDAwJSBvbiB0aGVzZS4KPgo+ID4gICB1aW50NjRfdCAtPiB1NjQKPiA+ICAgdWludDMy
X3QgLT4gdTMyCj4gPiAgIHVpbnQxNl90IC0+IHUxNgo+ID4gICB1aW50OF90ICAtPiB1OAo+ID4K
PiA+ICAgaW50NjRfdCAtPiBzNjQKPiA+ICAgaW50MzJfdCAtPiBzMzIKPiA+ICAgaW50MTZfdCAt
PiBzMTYKPiA+ICAgaW50OF90ICAtPiBzOAo+Cj4gSSdtIGRlZmluaXRlbHkgaW4gZmF2b3Igb2Yg
dGhlc2UgcmVuYW1lcy4gIEkgdGhvdWdodCBJIHdhcyB0aGUgb25seSBvbmUgdGhhdAo+IHRyaXBw
ZWQgb3ZlciB0aGUgdWludE5OX3Qgc3R1ZmY7IGF0IHRoaXMgcG9pbnQsIEkndmUgcHJvYmFibHkg
bG9zdCBob3VycyBvZiBteQo+IGxpZmUgdHJ5aW5nIHRvIHR5cGUgdGhvc2UgdGhpbmdzIG91dC4K
CldoYXQgc2hvdWxkIHRoZSBuZXh0IHN0ZXAgYmUgaGVyZT8gSSdkIGJlIGhhcHB5IHRvIHNwaW4g
YSBuZXcgdmVyc2lvbgp3aGVuZXZlciBvbiB3aGF0ZXZlciBiYXNlIGNvbW1pdCB5b3UgcHJlZmVy
LgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
