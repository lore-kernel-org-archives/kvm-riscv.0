Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C4DCCFA05
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 17:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TKQLCv+pnf5Vm7Nn50p0ZGOZdaRSYKZmnhVOqPar6Io=; b=W37lOPS61wcru39tm77VzXhPoi
	JlIBu9uvoJy6Lf2KYljIACCgPGr/vswu10Do3I7QOWd8J85d0HOyD6CUByoA7k1jwqJut0ZNpJOZI
	+5t8RoQaaLBReVyqcd8V7uisV193S+xYx5sQzQ3/G0ZDWID1EjoRRbZ7d/ETpyTJ6qJxpPlmHC1K4
	3es2NLDwA0maengRBsBkw2g2oCguA6keDvA6yYMu44z6i46ReG9tvF2p7GeTChWczEyoF+QJAUnDv
	KlZp9J0mFzXtQ1Ukm51lmd9vS1pnmhobjG/zxK1pamJnWueoqS7RyebS3ahEFPKTxZrTGMifjCOPU
	IxQ87YOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLJ3-0000000CJq1-0v2z;
	Tue, 04 Nov 2025 17:58:57 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLIz-0000000CJot-2NsW
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 17:58:55 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-295592eb5dbso37882175ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 04 Nov 2025 09:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279133; x=1762883933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=kBJsquQixHEtKG81CzFZIwQF9Kwr4vxTl+Y39pJJst6QVjxEgfvq+LU/Huay2thbdA
         WdyE5GMHsEP1U/DF1hlC+Bb3YeagFlIHV0N360WpvcecLqS+AtvIZdd8mH4JbNpE0tge
         kL/TDHm0vNJQHL4oPku6d5KvE0tod7lBvOSLdgCfcgGrc1hM06uXzTa8WsYllXcL/vcg
         7c7DSvFJ9ToIgI9+l2YEIlKE9eGbApJ+6q1OmdTQXkw5XoEqOjZFSYlhVh/VjuxZkh7f
         bcA/aAPxdE/RR/wGUjXCT9XWgIikMdsYKOcBiC6yW1TPoWVSxOBUjMwLiUBJ5RQTG/kM
         GPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279133; x=1762883933;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=DiK+WK/zsDEp4D1JTljS9ay9EpS8BNqtAJEycWpMB8PrhcjBncx2il2k3vCL2j1GoG
         5r3ynTUt+AQlaCqfrfjBs8X8E4mls9VQVCJiob/dlrgTQuNxZYJDZr7WeijoLbYPQP3E
         4zFuIv1bxHUyEziGTh3hSB1Rlb+a0iJLWoIw6ve9LlPs67Ft4/kNeBDkB61QkYkfAQaE
         +LlrscmRVziA9IB/BF89ErxLOyH0j8mj5XpD/x+Htvmtoh/V4vXYd3fBOQRUvuRXJOlG
         YUtNFS0y5Aa1VHpIPP/Se4iE420TP8eLyjA5jgol4xB76qYQ4FVotLuEqQgcJekc2Vln
         keXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOVHyjTnmqIW7E0JA7iPv9r4RPv4e7tXPPXN3u3bfS7+Ve6ybX2jVc8BTZtO3O0M7w4KtSfQYmLbg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwU+med/Y8DogdQjvmODSy64PI9pmGb3kUfMasl/3v/Tkqz92j+
	MC6RQ5yccM5RCLLb2PjUg/6zIJuYuqsm1hBe+HpB8D+MK2oVdaz8rp/sYSaxfkkZnzAtIDGB8c1
	qX/ZoDw==
X-Google-Smtp-Source: AGHT+IHo6/KH4EkXGXP40ZLufzSsgW7yh9/qU70MiYfxQR70XqX2CyQgg6697l1DVe5Ug6vhYlNvwdh/uJA=
X-Received: from plok6.prod.google.com ([2002:a17:903:3bc6:b0:269:8ca7:6998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f609:b0:295:4d97:84dd
 with SMTP id d9443c01a7336-2962adb8f9cmr4243385ad.51.1762279132506; Tue, 04
 Nov 2025 09:58:52 -0800 (PST)
Date: Tue, 4 Nov 2025 09:58:48 -0800
In-Reply-To: <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Message-ID: <aQo-2OQd8ktU0ygn@google.com>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_095853_610005_6B1095DB 
X-CRM114-Status: GOOD (  11.00  )
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

T24gRnJpLCBPY3QgMzEsIDIwMjUsIFJpY2sgUCBFZGdlY29tYmUgd3JvdGU6Cj4gT24gVGh1LCAy
MDI1LTEwLTMwIGF0IDEzOjA5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4g
djQ6Cj4gPiDCoC0gQ29sbGVjdCByZXZpZXdzL2Fja3MuCj4gPiDCoC0gQWRkIGEgbG9ja2RlcCBh
c3NlcnRpb24gaW4ga3ZtX3RkcF9tbXVfbWFwX3ByaXZhdGVfcGZuKCkuIFtZYW5dCj4gPiDCoC0g
V3JhcCBrdm1fdGRwX21tdV9tYXBfcHJpdmF0ZV9wZm4oKSB3aXRoIENPTkZJR19LVk1fR1VFU1Rf
TUVNRkQ9eS4gW3Rlc3QgYm90XQo+ID4gwqAtIEltcHJvdmUgKG9yIGFkZCkgY29tbWVudHMuIFtL
YWksIGFuZCBwcm9iYWJseSBvdGhlcnNdCj4gPiDCoC0gcy9zcHRlL21pcnJvcl9zcHRlIHRvIG1h
a2UgaXQgY2xlYXIgd2hhdCdzIGJlaW5nIHBhc3NlZCBpbgo+ID4gwqAtIFVwZGF0ZSBzZXRfZXh0
ZXJuYWxfc3B0ZSgpIHRvIHRha2UgQG1pcnJvcl9zcHRlIGFzIHdlbGwuIFtZYW5dCj4gPiDCoC0g
TW92ZSB0aGUgS1ZNX0JVR19PTigpIG9uIHRkaF9tcl9leHRlbmQoKSBmYWlsdXJlIHRvIHRoZSBl
bmQuIFtSaWNrXQo+ID4gwqAtIFRha2UgImFsbCIgdGhlIGxvY2tzIGluIHRkeF92bV9pb2N0bCgp
LiBbS2FpXQo+ID4gwqAtIFdBUk4gaWYgS1ZNIGF0dGVtcHRzIHRvIG1hcCBTUFRFcyBpbnRvIGFu
IGludmFsaWQgcm9vdC4gW1lhbl0KPiA+IMKgLSBVc2UgdGR4X2ZsdXNoX3ZwX29uX2NwdSgpIGlu
c3RlYWQgb2YgdGR4X2Rpc2Fzc29jaWF0ZV92cCgpIHdoZW4gZnJlZWluZwo+ID4gwqDCoCBhIHZD
UFUgaW4gVkNQVV9URF9TVEFURV9VTklOSVRJQUxJWkVEIHN0YXRlLiBbWWFuXQo+IAo+IERvIHlv
dSB3YW50IHNvbWVvbmUgdG8gZm9sbG93IHVwIHdpdGggYSB2MiBvZiB0aGlzIGFmdGVyIHRoZSBz
ZXJpZXMgbGFuZHM/ICh3aXRoCj4gQmluYmluJ3MgdmVyYmlhZ2UgY29tbWVudHMgaW5jb3Jwb3Jh
dGVkKQoKRmVlbCBmcmVlIHRvIHNlbmQgYSB2MiBub3cuICBPciBqdXN0IHJlcGx5IHRvIEJpbmJp
bidzIG1haWwgd2l0aCB0aGUgdXBkYXRlZApjb21tZW50LgoKPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9rdm0vMjAyNTEwMjgwMDI4MjQuMTQ3MDkzOS0xLXJpY2sucC5lZGdlY29tYmVAaW50ZWwu
Y29tLyN0CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
