Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC01CD98F7
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 00:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EPy4crltvo+Uvm5Y4V5sEnskMWzs352CS5Hh69AfhMo=; b=4iezQknn8k2OthOn/2+ylChPQy
	Hh8vZcUaFAkjacDaFRmXdauXlFIPcHZ+YSJXLULwsYTKjgcC6NwT3rWlzoBOH1V4pGfBE658UiulE
	RW/6BCTUA6Wuafwogn92SHgcqwG/JDu+QjSgJPtRPgjK52XkqQKw5NxKHu/JOnWy70oZhRdelBB2s
	fxGN+nXlah26CX2FrCYbpGPnkVqFWZnDd4WcPzZfV7+B3WPecMRBdH3zfZCedOZmAH1mLfiD4L1O6
	ugx0MN3fLT6lMMAlCKlRO2vwI/sF3mBkhVXYvdqHCWcROwlIOHzPFKll6Q2UHoF+U6ypPo7g/5L7f
	qQf2Czfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJi3D-0000000BMMp-3rgo;
	Fri, 14 Nov 2025 00:52:31 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJi3A-0000000BMLQ-1pO5
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 00:52:30 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2956a694b47so17976305ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Nov 2025 16:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763081547; x=1763686347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TPA+SbvqNREHpFcNdmFscbiex0UCXC+hEdJT9/ovnQ=;
        b=Hws1GJC1LDlYzEoIEv6o81XJodcAuIMfjHJgCzLcVCnF3No9NIlCl733gI/qBMtM7S
         o9GpH9pZb6h7kXTgV+VMccQUiSj4bR3i39nnwwKUvgd4irydwuXz4wpb2A3jwJ4rDqqm
         rSC6EEukJQQJdfnTPoXCyZUfEDSsnzre7pp7KdHRgKb83xdpEfy7MKxv8V4z0juyzjYd
         BXncOsf3JF8mn23ts1oW5m5Ie1Sbbr746ItQpqgsRNSGufvbvrBnNHURRfzAzQbkoTv9
         WQs8IY2G+H8YPZP/WnwYOHgx52XIZswYGkikLDlSkhqmDy8bD/GdMFrx5tnpDr4+zwhe
         HDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763081547; x=1763686347;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/TPA+SbvqNREHpFcNdmFscbiex0UCXC+hEdJT9/ovnQ=;
        b=MR63MM6kTDnqi5JkdebMHlTyumH+gClsym+BizhtCxkF3NbxZVUjr4YYIY/BJiLAQR
         dSNYXe2mVL+yY0hV8ybBiIPdHyXAwf7oRQNrHa7ktVfI8fH+RJueBYNeleLUrMFsFVcU
         p1xwKp3jZjEDW+sxxJ5mB2bmb+uYzeFmaYIQYOIQ0texNnUHphNtIY73vDKN4CPszHtr
         Sy8X1XLpiVHBn+iiHGUt1oHev7bEEiOFSUlfxEu9fn8SgLC/roLfjYZ+G0XuhHN+Ds8U
         uK1FQLxDaqNHW6owK6a+Zkh+AJRtZ8bUX/sXHr9pG/Jnk0AyBFWSrzZXLYK1pqo8O8nX
         PI5A==
X-Forwarded-Encrypted: i=1; AJvYcCUNtpZr1VYWHP8f+AgQz9lHdjCeYr40Gs7bD6OG6zTrPKQqc3QUHKTmt3Q4JimFLXGKeMCYE3jBhnw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf3P2VWc1sEjEo04BpUv2kKvrKBSxXWk4NN2UEe2CUZpXT5o+V
	Zz+I8vfWmsSd1eBKJDcKtUt2mBu/OfUx5sbbIJZyHHwxSyV8OshbVjm6GNB2ERWZmNxat1baqVs
	OXSD5Xg==
X-Google-Smtp-Source: AGHT+IGLVWzZcFvlcari672fVuzY1cTHp2qT0SnCsSIHeNMxH1YcSp/U/Uf2KDzI+67wEBxE6n1syvNyYxc=
X-Received: from plgz16.prod.google.com ([2002:a17:903:190:b0:296:18d:ea12])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22c5:b0:295:2c8e:8e44
 with SMTP id d9443c01a7336-2986a76bc1dmr11720965ad.59.1763081546590; Thu, 13
 Nov 2025 16:52:26 -0800 (PST)
Date: Thu, 13 Nov 2025 16:52:25 -0800
In-Reply-To: <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
Message-ID: <aRZ9SQ_G2lsmXtur@google.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
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
X-CRM114-CacheID: sfid-20251113_165228_468762_65C6C970 
X-CRM114-Status: GOOD (  16.42  )
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

T24gRnJpLCBPY3QgMTcsIDIwMjUsIERhdmlkIE1hdGxhY2sgd3JvdGU6Cj4gT24gVGh1LCBNYXkg
MSwgMjAyNSBhdCAyOjAz4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5j
b20+IHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMDEsIDIwMjUsIERhdmlkIE1hdGxhY2sgd3JvdGU6
Cj4gPiA+IFRoaXMgc2VyaWVzIHJlbmFtZXMgdHlwZXMgYWNyb3NzIGFsbCBLVk0gc2VsZnRlc3Rz
IHRvIG1vcmUgYWxpZ24gd2l0aAo+ID4gPiB0eXBlcyB1c2VkIGluIHRoZSBrZXJuZWw6Cj4gPiA+
Cj4gPiA+ICAgdm1fdmFkZHJfdCAtPiBndmFfdAo+ID4gPiAgIHZtX3BhZGRyX3QgLT4gZ3BhX3QK
PiA+Cj4gPiAxMDAwMCUgb24gdGhlc2UuCj4gPgo+ID4gPiAgIHVpbnQ2NF90IC0+IHU2NAo+ID4g
PiAgIHVpbnQzMl90IC0+IHUzMgo+ID4gPiAgIHVpbnQxNl90IC0+IHUxNgo+ID4gPiAgIHVpbnQ4
X3QgIC0+IHU4Cj4gPiA+Cj4gPiA+ICAgaW50NjRfdCAtPiBzNjQKPiA+ID4gICBpbnQzMl90IC0+
IHMzMgo+ID4gPiAgIGludDE2X3QgLT4gczE2Cj4gPiA+ICAgaW50OF90ICAtPiBzOAo+ID4KPiA+
IEknbSBkZWZpbml0ZWx5IGluIGZhdm9yIG9mIHRoZXNlIHJlbmFtZXMuICBJIHRob3VnaHQgSSB3
YXMgdGhlIG9ubHkgb25lIHRoYXQKPiA+IHRyaXBwZWQgb3ZlciB0aGUgdWludE5OX3Qgc3R1ZmY7
IGF0IHRoaXMgcG9pbnQsIEkndmUgcHJvYmFibHkgbG9zdCBob3VycyBvZiBteQo+ID4gbGlmZSB0
cnlpbmcgdG8gdHlwZSB0aG9zZSB0aGluZ3Mgb3V0Lgo+IAo+IFdoYXQgc2hvdWxkIHRoZSBuZXh0
IHN0ZXAgYmUgaGVyZT8gSSdkIGJlIGhhcHB5IHRvIHNwaW4gYSBuZXcgdmVyc2lvbgo+IHdoZW5l
dmVyIG9uIHdoYXRldmVyIGJhc2UgY29tbWl0IHlvdSBwcmVmZXIuCgpTb3JyeSBmb3IgdGhlIHNs
b3cgcmVwbHksIEkndmUgaGFkIHRoaXMgd2luZG93IHNpdHRpbmcgb3BlbiBmb3Igc29tZXRoaW5n
IGxpa2UKdHdvIHdlZWtzLgoKTXkgc2xvd25lc3MgaXMgbGFyZ2VseSBiZWNhdXNlIEknbSBub3Qg
c3VyZSBob3cgdG8gbGFuZC9hcHByb2FjaCB0aGlzLiAgSSdtIDEwMCUKaW4gZmF2b3Igb2YgdGhl
IHJlbmFtZXMsIGl0J3MgdGhlIHRpbWluZyBhbmQgY29vcmRpbmF0aW9uIEknbSB1bnN1cmUgb2Yu
CgpJbiBoaW5kc2lnaHQsIGl0IHByb2JhYmx5IHdvdWxkIGhhdmUgYmVzdCB0byBzcXVlZXplIGl0
IGludG8gNi4xOCwgc28gYXQgbGVhc3QKdGhlIG1vc3QgcmVjZW50IExUUyB3b3VsZG4ndCBnZW5l
cmF0ZSBjb25mbGljdHMgYWxsIG92ZXIgdGhlIHBsYWNlLiAgVGhlIG5leHQKYmVzdCBvcHRpb24g
d291bGQgcHJvYmFibHkgYmUgdG8gc3BpbiBhIG5ldyB2ZXJzaW9uLCBicmliZSBQYW9sbyB0byBh
cHBseSBpdCBhdAp0aGUgZW5kIG9mIHRoZSBuZXh0IG1lcmdlIHdpbmRvdywgYW5kIHRhZyB0aGUg
d2hvbGUgdGhpbmcgZm9yIHN0YWJsZUAgKG1heWJlCmxpbWl0ZWQgdG8gNi4xOCs/KSB0byBtaW5p
bWl6ZSBkb3duc3RyZWFtIHBhaW4uCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
