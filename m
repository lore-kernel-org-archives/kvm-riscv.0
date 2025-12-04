Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CEDD1CDAF
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 00:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tNWFt0R2P+u97slKzYXuyNJOe2WVqHpSSxqvGf4UTs=; b=OXziQmLdxOkt+C
	Oirt6cURErttMRiM7EzoxNkfsArRFWQcjl8LZzG1hxcmgB6nZg5wJayDEickVqWy25Lq1vAvb7Wl4
	vAbYfiFIkOqenWtMNI8XvucvRzCmUGNYtO5Nv1tMPKKHjTXxF9K+InJjh+OIthQbvImAy+lQ4AHX9
	c4JL1jU9h0Sc7e4mClUpTPrJrzm2z2gLqyB1H01Xf+dfTyCfmtIRThIDo2naGj6OvdpzKDKd0jUYk
	xAlGtoYweVYoHU5uNDeVKTBoAOSvMDNhw2mzRochD4DRGUohfLy8wcOkla/xwIIaOC3Rt7Ffl3nOs
	RBwInGV5vLck+0FybKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwqZ-00000007HSw-39Xy;
	Thu, 04 Dec 2025 00:05:23 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwqU-00000007HRT-1agt
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 00:05:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5942a631c2dso492624e87.2
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Dec 2025 16:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764806715; x=1765411515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zd9WoFQTvNfYXS0FutJkOHLRDDNZG45Z8fkn2eFEtfA=;
        b=1CXqANjYiFFlKp9ftWDR2yPyqTVXyegf1rwShRdeLWGH+JEYiYhN2b9xqZmnzEmrYd
         F5ZGkqPy7e3YFOA2Z26dImzGkWa3nH96T+1BFWnoWsxxbAbUsrIyFSHr69ekSprQR2k3
         0fGci5L4Z/7mXCLjPiJI0eRhv4aCANcfDA0CDFitCf1AhLP8zBDG/v+IAWM0s2Uvlzfa
         r4D0zJeixlGWR0MYUXvogMPL6jWsKwDVROKWiSl+5tLdjh7hYVku5E4EQB3FcGFIV8d0
         wrW8TiJpc4lejKZEBctzm3jqAUMpLrC37e3VCuylHh7ANssEMdh3uCn5E0QnCdmOKXSP
         eckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764806715; x=1765411515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zd9WoFQTvNfYXS0FutJkOHLRDDNZG45Z8fkn2eFEtfA=;
        b=OZ8GooF1gNdlpNladrvFSoxGuVTUcghAI8qMv+ATrb5uPN9iLcgPWe6lkLnuH5R0Gw
         0TjzODLG9brKgaiEkV8jNZsIbxqiLhPIgwR63rZuN3vYxrU0/ELH34iApigLSsHfz81H
         fMKQ8zJSCQK/9u/PoOQvBBLrTkHlv81e3UjdLNMSyNsKZfsEzdRDKv/jW13MA/Qh5BKg
         q45En0c/W9nEp5h1jp+akj+m5BAMyvRbJ3IjGK7uEkmsT3qs8Otnl1CddwAa7I7asr5f
         PTwgYEgrFxD7Y2Z0EoSknL9Typniea8pjtv+XAN2Q40Uj/hnMJud+sUCvvCLC3bIfqM2
         bmBw==
X-Forwarded-Encrypted: i=1; AJvYcCX/UuC+jUkKKqni/JhziysLzCPja5JrAmDtDgU4XkPzcan8q2qI1ezXEM3UAU9AAxAdxHM+HE1xmW8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxF+xCuSWhlQkR7sCJvTfG5gRK9tYRX/gsKyRkMDdkMG5enhDlq
	BdgLfJ1uNtQB2o/erpPTO/PewQFiaKiX/urWTLOyQYUM3L0I5KzPRQTN3QoWInJNxtZuFL0SntB
	ZtR7aPens1p3ud5hnIleBt1lg4qNhYapI40USaa/H
X-Gm-Gg: ASbGncvl9ELL+nm3rJvr/oniipKda48I+cH9BIsuXdjrdIncbLdOTdJYodjfNn9pkx6
	P2YOGo/FmDwtuvEPWDvOzDKcZzhiLNZWL8PJqp/c0zYCP5iWs9zKj0OBBSvIO0YDO/G/OYFE4h9
	4vAKS71Eks/N2vR9m4cj12BOq7BPvqyAicnOcUIX4ha8Et/mZrxUVGbiJGYseyv8ZPfsFgcDcDq
	Ax4VK1TIGFIFCYZKSqAITQM0FB9hSHO0qgXzsSo/UU7NS48zVsO1x/km6POXjXcCBMCUGaC
X-Google-Smtp-Source: AGHT+IF4CyNFKv3NT4Ky0XeOn1TQzX5YXD6kxpQuevTbiLqvfi0Z1H0r6mqBjI/VHgPS5RUsjZgaT368W08YU9UmgDU=
X-Received: by 2002:a05:6512:12c4:b0:578:ed03:7b5f with SMTP id
 2adb3069b0e04-597d3f7b821mr1673675e87.26.1764806715139; Wed, 03 Dec 2025
 16:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com> <aRZ9SQ_G2lsmXtur@google.com>
In-Reply-To: <aRZ9SQ_G2lsmXtur@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 3 Dec 2025 16:04:47 -0800
X-Gm-Features: AWmQ_blvUOA-vJuP7PArgXkGtxVwcyZaljS6okCvAjRlV-VnKxXpsCQN-Lg9GyA
Message-ID: <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251203_160518_430029_03CA7C5C 
X-CRM114-Status: GOOD (  23.28  )
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

T24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgNDo1MuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDE3LCAyMDI1LCBEYXZpZCBN
YXRsYWNrIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMSwgMjAyNSBhdCAyOjAz4oCvUE0gU2VhbiBD
aHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiBPbiBUaHUsIE1h
eSAwMSwgMjAyNSwgRGF2aWQgTWF0bGFjayB3cm90ZToKPiA+ID4gPiBUaGlzIHNlcmllcyByZW5h
bWVzIHR5cGVzIGFjcm9zcyBhbGwgS1ZNIHNlbGZ0ZXN0cyB0byBtb3JlIGFsaWduIHdpdGgKPiA+
ID4gPiB0eXBlcyB1c2VkIGluIHRoZSBrZXJuZWw6Cj4gPiA+ID4KPiA+ID4gPiAgIHZtX3ZhZGRy
X3QgLT4gZ3ZhX3QKPiA+ID4gPiAgIHZtX3BhZGRyX3QgLT4gZ3BhX3QKPiA+ID4KPiA+ID4gMTAw
MDAlIG9uIHRoZXNlLgo+ID4gPgo+ID4gPiA+ICAgdWludDY0X3QgLT4gdTY0Cj4gPiA+ID4gICB1
aW50MzJfdCAtPiB1MzIKPiA+ID4gPiAgIHVpbnQxNl90IC0+IHUxNgo+ID4gPiA+ICAgdWludDhf
dCAgLT4gdTgKPiA+ID4gPgo+ID4gPiA+ICAgaW50NjRfdCAtPiBzNjQKPiA+ID4gPiAgIGludDMy
X3QgLT4gczMyCj4gPiA+ID4gICBpbnQxNl90IC0+IHMxNgo+ID4gPiA+ICAgaW50OF90ICAtPiBz
OAo+ID4gPgo+ID4gPiBJJ20gZGVmaW5pdGVseSBpbiBmYXZvciBvZiB0aGVzZSByZW5hbWVzLiAg
SSB0aG91Z2h0IEkgd2FzIHRoZSBvbmx5IG9uZSB0aGF0Cj4gPiA+IHRyaXBwZWQgb3ZlciB0aGUg
dWludE5OX3Qgc3R1ZmY7IGF0IHRoaXMgcG9pbnQsIEkndmUgcHJvYmFibHkgbG9zdCBob3VycyBv
ZiBteQo+ID4gPiBsaWZlIHRyeWluZyB0byB0eXBlIHRob3NlIHRoaW5ncyBvdXQuCj4gPgo+ID4g
V2hhdCBzaG91bGQgdGhlIG5leHQgc3RlcCBiZSBoZXJlPyBJJ2QgYmUgaGFwcHkgdG8gc3BpbiBh
IG5ldyB2ZXJzaW9uCj4gPiB3aGVuZXZlciBvbiB3aGF0ZXZlciBiYXNlIGNvbW1pdCB5b3UgcHJl
ZmVyLgo+Cj4gU29ycnkgZm9yIHRoZSBzbG93IHJlcGx5LCBJJ3ZlIGhhZCB0aGlzIHdpbmRvdyBz
aXR0aW5nIG9wZW4gZm9yIHNvbWV0aGluZyBsaWtlCj4gdHdvIHdlZWtzLgoKTm8gd29ycmllcywg
dGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIDopCgo+Cj4gTXkgc2xvd25lc3MgaXMgbGFyZ2VseSBi
ZWNhdXNlIEknbSBub3Qgc3VyZSBob3cgdG8gbGFuZC9hcHByb2FjaCB0aGlzLiAgSSdtIDEwMCUK
PiBpbiBmYXZvciBvZiB0aGUgcmVuYW1lcywgaXQncyB0aGUgdGltaW5nIGFuZCBjb29yZGluYXRp
b24gSSdtIHVuc3VyZSBvZi4KPgo+IEluIGhpbmRzaWdodCwgaXQgcHJvYmFibHkgd291bGQgaGF2
ZSBiZXN0IHRvIHNxdWVlemUgaXQgaW50byA2LjE4LCBzbyBhdCBsZWFzdAo+IHRoZSBtb3N0IHJl
Y2VudCBMVFMgd291bGRuJ3QgZ2VuZXJhdGUgY29uZmxpY3RzIGFsbCBvdmVyIHRoZSBwbGFjZS4g
IFRoZSBuZXh0Cj4gYmVzdCBvcHRpb24gd291bGQgcHJvYmFibHkgYmUgdG8gc3BpbiBhIG5ldyB2
ZXJzaW9uLCBicmliZSBQYW9sbyB0byBhcHBseSBpdCBhdAo+IHRoZSBlbmQgb2YgdGhlIG5leHQg
bWVyZ2Ugd2luZG93LCBhbmQgdGFnIHRoZSB3aG9sZSB0aGluZyBmb3Igc3RhYmxlQCAobWF5YmUK
PiBsaW1pdGVkIHRvIDYuMTgrPykgdG8gbWluaW1pemUgZG93bnN0cmVhbSBwYWluLgoKV2l0aCBM
UEMgY29taW5nIHVwIEkgd29uJ3QgaGF2ZSBjeWNsZXMgdG8gcG9zdCBhIG5ldyB2ZXJzaW9uIGJl
Zm9yZQp0aGUgNi4xOSBtZXJnZSB3aW5kb3cgY2xvc2VzLgoKSSdtIHRlbXB0ZWQgdG8gc2F5IGxl
dCdzIGp1c3Qgd2FpdCBmb3IgdGhlIG5leHQgTFRTIHJlbGVhc2UgYW5kIG1lcmdlCml0IGluIHRo
ZW4uIFRoaXMgaXMgbG93IHByaW9yaXQsIHNvIEknbSBmaW5lIHdpdGggd2FpdGluZy4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
