Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4056C36008
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 01:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lxtmHEoiUowFR00g0gV/xOIzILP5SRK4omWpppTU+CU=; b=Ei268K/mNg/ju8pi/Xjvl5lWi/
	23KBhGH9diIV9WiP/UvIrIpHvCq+28vnbk5XRz9Oc/iOTOvwa/h13q13zk1UNQjuyXKIaUhSrjcp/
	7BZnI27oasxCcWW1ypuu3LQXMTejN5me+e0rNDVXAiVPAJ7A/HYRlBMc/t+wEry6FR6NAgl0/aNPG
	DvmrqoGknXp5DHBmA+B+pHD2jrI/GN+ZC5Emk4TWGI8ThRcxmhXz/GI6kQreJwtFueiN40ekmetBE
	Ny0ZrOUUAI6q4XA9qakBOBMfACMJn83nW77qekujVux8JXSXvcYPc8/djC7sIKf7UjGBZCU4Z9ARj
	q/ZT39Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txcTS-00000009xsB-0p8L;
	Thu, 27 Mar 2025 01:56:02 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txcTP-00000009xr6-2zdq
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 01:56:00 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso1178613a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Mar 2025 18:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743040558; x=1743645358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL2Dl7aHbf0dGqs5JcynZqdOq7r3zC+FjBGKQXAT1Og=;
        b=uM/0Kqj+IjJV8KURvQrobt99QHAb4Qet827T4WATOJxlLQYNI7Larj3Hb+4+1RRPkd
         XmRemOXkc20jriTVXTvDAX4YUwa10Je3eWKy7eFCm9HeR4rGruBGyHfy7gOrJZjR6Wwd
         vfmYQWvX3iJ0X2sDw7vgoTU/VvenPqzBuZzmQbqp/R6PTT8hiwKbD9tc/WRE1usyCR9t
         gTlwtwj2XMr6w/KLU9/h8xY1GM1bDdZVYvDxCtGryrrV6aoKv+NjMsZozEvmmrj9ZPEl
         fHqp7Lb8fzREN/9yJhLU3mjx/tRqZB6CzWVxGEArEwE4LlN4SX/PMfcoeCqrTma/u826
         PgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743040558; x=1743645358;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nL2Dl7aHbf0dGqs5JcynZqdOq7r3zC+FjBGKQXAT1Og=;
        b=EErUAzEmmC+eOqOOhh0WLtMOMBmPuv5qW+5EUt27LUTQVq0Liig5QQVCvbSga61SJW
         7oCjR9+3dHHW6ACEoayXPfwkF5f8DxpenLpqKhcg4p6ifIG/Tx7OYT3ALcyjKKglsSUW
         +VBhKr2QHCb1J1xLPVH1zny3lA6pBOwgU73HXgJhFR/CqoeZy8pNltS3I1ZCrFd8jp4/
         KWDIBBCUn6DOOsbHJBIr2FJANRQkfXcqDtRLwmHFx6PnopZwGvrpLbVixVSrT7ilTdob
         Kya/SI3Pszb4IRepPHdzSupmNjZ0ZGeD04gdXtlNKfF8ghtEWBVBCYPEr5FSHINdxwEz
         0J8A==
X-Forwarded-Encrypted: i=1; AJvYcCW6uqEIlz9n94/xaoh5a1LLXhsQOf6DYygHVlzvMU4LGuVqlM75xOLzxxHIQH6QaPwXzrhOsAvG0+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzPCmBH5yDT301Q6LRphbO1Rb73WHGT+B0Jp08S8zHpWWgbi4l
	wV/eKiVZ8f/0rdOm1QUSa0yT5FrfXRpudkqBo82v8MdM9XDaDSN+AsDRapm3dXagqe0UOUNqG0w
	k2w==
X-Google-Smtp-Source: AGHT+IEfwvWga4q7lvhLPDENhsAb7G3rkv8tEZdsZcr/UUcxc0nnbiUdoNTNjhEeozTWOF/6PLRrloEjC8g=
X-Received: from pjyr7.prod.google.com ([2002:a17:90a:e187:b0:2ef:82c0:cb8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc48:b0:301:6343:1626
 with SMTP id 98e67ed59e1d1-303a7c5b67fmr2721967a91.1.1743040557543; Wed, 26
 Mar 2025 18:55:57 -0700 (PDT)
Date: Wed, 26 Mar 2025 18:55:55 -0700
In-Reply-To: <CAHBxVyFLeZFwEnJYa-oUbAKVimdVsr=Ct76Jf=TyWeoAkHe8yQ@mail.gmail.com>
Mime-Version: 1.0
References: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com>
 <Z9hI5vEHngcKvvRa@google.com> <CAHBxVyFLeZFwEnJYa-oUbAKVimdVsr=Ct76Jf=TyWeoAkHe8yQ@mail.gmail.com>
Message-ID: <Z-SwK1xO_S4phG2o@google.com>
Subject: Re: [PATCH] RISC-V: KVM: Teardown riscv specific bits after kvm_exit
From: Sean Christopherson <seanjc@google.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_185559_743002_CE649B59 
X-CRM114-Status: GOOD (  23.47  )
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

T24gVGh1LCBNYXIgMjAsIDIwMjUsIEF0aXNoIEt1bWFyIFBhdHJhIHdyb3RlOgo+IE9uIE1vbiwg
TWFyIDE3LCAyMDI1IGF0IDk6MDjigK9BTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4gPiBPbiBNb24sIE1hciAxNywgMjAyNSwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gPiA+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgfCA0ICsrLS0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiA+
ID4gaW5kZXggMWZhOGJlNWVlNTA5Li40YjI0NzA1ZGM2M2EgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL21haW4uYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiA+
ID4gQEAgLTE3Miw4ICsxNzIsOCBAQCBtb2R1bGVfaW5pdChyaXNjdl9rdm1faW5pdCk7Cj4gPiA+
Cj4gPiA+ICBzdGF0aWMgdm9pZCBfX2V4aXQgcmlzY3Zfa3ZtX2V4aXQodm9pZCkKPiA+ID4gIHsK
PiA+ID4gLSAgICAga3ZtX3Jpc2N2X3RlYXJkb3duKCk7Cj4gPiA+IC0KPiA+ID4gICAgICAga3Zt
X2V4aXQoKTsKPiA+ID4gKwo+ID4gPiArICAgICBrdm1fcmlzY3ZfdGVhcmRvd24oKTsKPiA+Cj4g
PiBJIHdvbmRlciBpZiB0aGVyZSdzIGEgd2F5IHdlIGNhbiBndWFyZCBhZ2FpbnN0IGt2bV9pbml0
KCkva3ZtX2V4aXQoKSBiZWluZyBjYWxsZWQKPiA+IHRvbyBlYXJseS9sYXRlLiAgeDg2IGhhZCBz
aW1pbGFyIGJ1Z3MgZm9yIGEgdmVyeSBsb25nIHRpbWUsIGUuZy4gc2VlIGNvbW1pdAo+ID4gZTMy
YjEyMDA3MWVhICgiS1ZNOiBWTVg6IERvIF9hbGxfIGluaXRpYWxpemF0aW9uIGJlZm9yZSBleHBv
c2luZyAvZGV2L2t2bSB0byB1c2Vyc3BhY2UiKS4KPiA+Cj4gPiBFLmcuIG1heWJlIHdlIGRvIHNv
bWV0aGluZyBsaWtlIGNyZWF0ZStkZXN0cm95IGEgVk0gYXQgdGhlIGVuZCBvZiBrdm1faW5pdCgp
IGFuZAo+ID4gdGhlIGJlZ2lubmluZyBvZiBrdm1fZXhpdCgpPyAgTm90IHN1cmUgaWYgdGhhdCB3
b3VsZCB3b3JrIGZvciBrdm1fZXhpdCgpLCBidXQgaXQKPiA+IHNob3VsZCBkZWZpbml0ZWx5IGJl
IGZpbmUgZm9yIGt2bV9pbml0KCkuCj4gPgo+IFllcy4gVGhhdCB3b3VsZCBiZSBzdXBlciB1c2Vm
dWwuIEkgYW0gbm90IHN1cmUgYWJvdXQgdGhlIGV4YWN0Cj4gbWVjaGFuaXNtIHRvIGFjaGlldmUg
dGhhdCB0aG91Z2guCgpNZSBlaXRoZXIgOi0pCgo+IERvIHlvdSBqdXN0IHRlc3QgY29kZSBndWFy
ZGVkIHdpdGhpbiBhIG5ldyBjb25maWcgdGhhdCBqdXN0Cj4gY3JlYXRlcy9kZXN0cm95cyBhIGR1
bW15IFZNID8KClRoYXQncyBvbmx5IGlkZWEgSSBjb3VsZCBjb21lIHVwIHdpdGggdG9vLCBidXQg
SSBkb24ndCBwYXJ0aWN1bGFyeSBsaWtlIGl0LgoKPiBNYXkgYmUga3VuaXQgdGVzdCBmb3IgS1ZN
IGZpdHMgaGVyZSBpbiBzb21lIHdheSA/CgpJIGRvbid0IHRoaW5rIGEga3VuaXQgdGVzdCB3b3Vs
ZCBiZSBhIGdvb2QgZml0LCB0aGVyZSBhcmUgbGlrZWx5IHRvbyBtYW55CmRlcGVuZGVuY2llcywg
YW5kIEknbSBwcmV0dHkgc3VyZSB3ZSdkIHN0aWxsIG5lZWQgdG8gaGFjayBLVk0uCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
