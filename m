Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A90D730B2
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weF0MLIpRWIeXGUda7kSSrfo30jHmBIsaw+1pE4okEo=; b=TgUU9N27YDSBmX
	QYhW8mTys19F9SoUsjFuXlBXU3elISmBgXyCq2gmVZ+14MAsLh2HkPpZ9GwgyxaIDXd5e5qjQH1Do
	2vHTIuJRSTjBmeYLqVOleuyb3gUlPhTUNYvMly7ZW3WlriuJJoFFEFzQ2tLYOzfWAMKVC2TmnPbMF
	FwUiM6oqoFKWk6ewhl3JV5CbXi2n4jfSQ5nRV/RM3UKub4YDtlfu/XNCgSbuOwxG37hG21KvHWCkW
	Z9xnP/bJ02kOmcpLsIlWzVbc2fex+X0eGFv1L7tBphIN555u47+B5Uc6URR1XhoX8FjOrPi7mU109
	oiJ/7M6UaWdO5Ge2ODsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dl7-000000020m3-08D4;
	Fri, 03 Apr 2026 12:36:21 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dl3-000000020lI-49uM
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 12:36:19 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7d74dbfe84cso1239804a34.1
        for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 05:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775219777; cv=none;
        d=google.com; s=arc-20240605;
        b=adSzARRD7Sk8EQ9Kachpn7pudzUilrXt13vSFk9KDyM05+2KM6V3QxdoCA4Z8M77Gz
         pmHjddpGzQs0FKd86aDZMUQDuxCTq/mgmO8qURToK0I1+mvkniP0cvAsoRz9r4GSzkl7
         tnO1ly4G9thNW8gr1dzuxoN5JBqN9s4vTC7umH32Gih+bMWlTIEyCDQM39mGX6uJghBi
         zuhUsUJzPkVqrBhQOzE9hlfd7pA+gTHGC7NUC3+7pZ3WreZpBHDX1Q9/Nd3TXMPjm4MD
         JkKRDN1pbXevB/jzfCGoagIgIKb7Led6sIt/P3Kj1nn1rR7TTcDzT+54/xgz0z9DwRVG
         gSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f489z9Q14+/QBLo/ZJR97CzCHDWPhtl1lFkJsX7ZtzE=;
        fh=VT9+ptoCy6ZLbdrvX7JdUnPWD2Bc6J7QmQYM83/WChU=;
        b=gxt7QPWLKHm2nQkPDp3poFUoAstVrdkPbSARSUt+vAjxLKH4pH9BfZsoiquEd5f4Zo
         GS5GMa19g5/ffS3jB67Cl7Ej/np8OGy3aVfzrswQDnY9bgxoVNnGwE8D2eejI74xogAl
         tcbNn2nJu6irzgd4GwZbH6kEambnX/8fuzwMRYf9zhGS8rjX51awVAKbQBZat+g0sNfn
         JqBFNCaPNA/F7Ovi/b5MyD2B62cBDs3PUgf+ZMKGXGqsM4t0aAHNJFGA5ZjD+EDEemvp
         fLuD9sEHVm+aaTQ+dDGbHBiohcoQkkI2q3pT6sTqc3PPBcJ25tA7SbqYvJ3hpVTYz4aK
         YMsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775219777; x=1775824577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f489z9Q14+/QBLo/ZJR97CzCHDWPhtl1lFkJsX7ZtzE=;
        b=tnbsQHVgd0qYLd2IW1FK4TMTvIhgYeAGSA3mtPuVB+vsJX1IBKeqVQgdtbv0/Q9iys
         kkhB5JeZEIm9t2jh7PJmnIOLlOBZ5KaaSBz5lsoumK1V0bXfgXWNzDLDloN31561/8or
         aIohC6CIExFqHpwa0DNs3gP6GztV+S2lAy2eluu0aR2ajIw9yRGuv3uCD8wsJ7B9PZ0i
         mgQIZepsVkhZa4vFOYeUpEQedRog+76dm7jJyNwwQ/P1X0RKvVDcj7EPiWm8tn7jf6Pp
         eq6zZziOafFO4xbGXa5POS1VzRrUv396oxW0rABJGy7gj1QvXUybVPD2uGArygbvHlEG
         6OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775219777; x=1775824577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f489z9Q14+/QBLo/ZJR97CzCHDWPhtl1lFkJsX7ZtzE=;
        b=XbDy56tlqbpKlQ2vI6V695cB61bG6Y6Hp7NEUIUIxYZkb1eX82VNhdkVnKH/cIduK+
         B5F62HottDGF4IBObuLypoq50egV0/HvApDFiHiEL3jCTB750NOf03FPONzE5wp32a/q
         bh85cwq9BxCAImBTdyWM5rB4gnm7oXql8zibMUTEeHE9Cga7sGJY7oGyWnjffV2QT2sv
         giv8UBaxKKJ+Ahwnyu61zbcKT3hXj9Sr2SGs8SvzrJswEbo+1PAVsR9o0GK+0Vo7mhB7
         nA5pOyCGZB+EuAc8VY34cNWL3Lm0x+TAJ40hv/IDXUWRTwSMrNxsGja6+3/OIFAcezzy
         QqSg==
X-Forwarded-Encrypted: i=1; AJvYcCWZOa0SBf6twjScMa88zca0WzR/cOmwlGSjwryiURPFcDXBqDtHFN6FuY2g73z1zc4074YsNqxPUzk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbH3RyMeWORFNf21qmvEwWYb90qEk+8mccJ3UUEEKrxZj2lhbi
	0w/Lb4O35rFvCcUepfG+q9wJXq7P5JtwZVk9zMjKE7j/KXuNEsUrkH7E1rx584KyPvnpDifYsCO
	UaPFHjHpXCex60ShwcHo1TnQ29ePmlWj+q/nEYd04Sw==
X-Gm-Gg: ATEYQzy4dzIaWwOk8sM0ksppLymNAVRexI+gY7FAI8p6oDdvdYgzSyfaqvtOaZciPWR
	wFjb39mMPSvOpEn/4QcddIYjyC7FalQ3+FPDBzZilm4JqJfU+MSMaQuCaYlZYbmDvZXWctb80t9
	VqZZAGz+b5ISZZXv9FewERa9roKdLnDc62VMEdZlL4d9A+JjrQdgzhUnM7jxRCF/6N4nF5zx1vN
	GKHVt/MSSaoH8b2U2tXXqGMlhqcs9C0ILRCiAmR6aIHAtBO8rY4z/mntgZEgKAcZWjiDXcQNT9t
	8u+JE+1cd9tLBNux7SndTz3oWHIboNtlY7gfjOK/zG0ao7oHJ98wg3MavmbA48AESNYpbW9FqRS
	3XYAvMguUjJwxJ+IAhzI3B6VospE=
X-Received: by 2002:a05:6820:f024:b0:67d:f56f:fe00 with SMTP id
 006d021491bc7-6822064c872mr1411396eaf.49.1775219776853; Fri, 03 Apr 2026
 05:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 18:06:05 +0530
X-Gm-Features: AQROBzCZaj5NdnrddgbMifGi2nGpuLv9sXk2KqbS9U2BYMG_GPqE8MDkvi1tBQM
Message-ID: <CAAhSdy3EDro0fOTh+Hi6s6DUU6ENg+ufuUQqTG70g8xpSy7Keg@mail.gmail.com>
Subject: Re: [PATCH 00/27] Nested virtualization for KVM RISC-V
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_053618_037684_359504C4 
X-CRM114-Status: GOOD (  15.23  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTozMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBJbml0aWFsIG5lc3RlZCB2aXJ0dWFsaXphdGlv
biBzdXBwb3J0IGZvciBLVk0gUklTQy1WLiBVc2luZwo+IHRoaXMgc2VyaWVzLCB3ZSBjYW4gYm9v
dCBYdmlzb3IgaW5zaWRlIEtWTSBndWVzdCBhbmQgS1ZNIFJJU0MtVgo+IGluc21vZCBhbHNvIHdv
cmtzIGluc2lkZSBLVk0gZ3Vlc3QgYnV0IHdlIGNhbid0IHJ1biBuZXN0ZWQgZ3Vlc3QKPiBhdCB0
aGUgbW9tZW50IGR1ZSB0byB3b3JrLWluLXByb2dyZXNzIEctc3RhZ2UgZW11bGF0aW9uIChvcgo+
IEctc3RhZ2UgcGFnZSB0YWJsZSB3YWxrZXIpLgo+Cj4gUGF0Y2gwMS10by1QYXRjaDA5OiBGaXhl
cyBhbmQgcHJlcGFyYXRvcnkgY2hhbmdlcwo+IFBhdGNoMTAtdG8tUGF0Y2gyMzogQWN0dWFsIG5l
c3RlZCB2aXJ0dWFsaXphdGlvbiBzdXBwb3J0Cj4gUGF0Y2gyNC10by1QYXRjaDI3OiBPTkVfUkVH
IGludGVyZmFjZSBhbmQgZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0Cj4KPiBVcGNvbWluZyB3b3JrIG9u
LXRvcC1vZiB0aGlzIHNlcmllcyBpbmNsdWRlOgo+ICAqIFNvZnR3YXJlIE1NVSBlbXVsYXRpb24g
Zm9yIG5lc3RlZCBndWVzdCAoYWthIHN3dGxiKQo+ICAqIEhMVi9IU1YgZW11bGF0aW9uCj4gICog
U3N0YyBlbXVsYXRpb24gZm9yIG5lc3RlZCBndWVzdAo+ICAqIFNCSSBOQUNMIGZvciBndWVzdCBo
eXBlcnZpc29yCj4gICogLi4uIGFuZCBtb3JlIC4uLgo+Cj4gVGhlc2UgcGF0Y2hlcyBjYW4gYWxz
byBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zfa3ZtX25lc3RlZF92MQo+IGJyYW5jaCBhdDogaHR0cHM6
Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4KPiBBbnVwIFBhdGVsICgyNyk6Cj4gICBS
SVNDLVY6IEtWTTogRml4IGVycm9yIGNvZGUgcmV0dXJuZWQgZm9yIFNtc3RhdGVlbiBPTkVfUkVH
Cj4gICBSSVNDLVY6IEtWTTogRml4IGVycm9yIGNvZGUgcmV0dXJuZWQgZm9yIFNzYWlhIE9ORV9S
RUcKPiAgIFJJU0MtVjogS1ZNOiBDaGVjayBob3N0IFNzYWlhIGV4dGVuc2lvbiB3aGVuIGNyZWF0
aW5nIEFJQSBpcnFjaGlwCj4gICBSSVNDLVY6IEtWTTogSW50cm9kdWNlIGNvbW1vbiBrdm1fcmlz
Y3ZfaXNhX2NoZWNrX2hvc3QoKQo+ICAgUklTQy1WOiBLVk06IEZhY3Rvci1vdXQgSVNBIGNoZWNr
cyBpbnRvIHNlcGFyYXRlIHNvdXJjZXMKPiAgIFJJU0MtVjogS1ZNOiBNb3ZlIHRpbWVyIHN0YXRl
IGRlZmluZXMgY2xvc2VyIHRvIHN0cnVjdCBpbiBVQVBJIGhlYWRlcgo+ICAgUklTQy1WOiBLVk06
IEFkZCBoaWRlbGVnIHRvIHN0cnVjdCBrdm1fdmNwdV9jb25maWcKPiAgIFJJU0MtVjogS1ZNOiBG
YWN0b3Itb3V0IFZDUFUgY29uZmlnIGludG8gc2VwYXJhdGUgc291cmNlcwo+ICAgUklTQy1WOiBL
Vk06IERvbid0IGNoZWNrIGhzdGF0ZWVuMCB3aGVuIHVwZGF0aW5nIHNzdGF0ZWVuMCBDU1IKPiAg
IFJJU0MtVjogS1ZNOiBJbml0aWFsIHNrZWxldGFsIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBzdXBw
b3J0Cj4gICBSSVNDLVY6IEtWTTogVXNlIGhhbGYgVk1JRCBzcGFjZSBmb3IgbmVzdGVkIGd1ZXN0
Cj4gICBSSVNDLVY6IEtWTTogRXh0ZW5kIGt2bV9yaXNjdl9tbXVfdXBkYXRlX2hnYXRwKCkgZm9y
IG5lc3RlZAo+ICAgICB2aXJ0dWFsaXphdGlvbgo+ICAgUklTQy1WOiBLVk06IEV4dGVuZCBrdm1f
cmlzY3ZfdmNwdV9jb25maWdfbG9hZCgpIGZvciBuZXN0ZWQKPiAgICAgdmlydHVhbGl6YXRpb24K
PiAgIFJJU0MtVjogS1ZNOiBFeHRlbmQga3ZtX3Jpc2N2X3ZjcHVfdXBkYXRlX3RpbWVkZWx0YSgp
IGZvciBuZXN0ZWQgdmlydAo+ICAgUklTQy1WOiBLVk06IEV4dGVuZCB0cmFwIHJlZGlyZWN0aW9u
IGZvciBuZXN0ZWQgdmlydHVhbGl6YXRpb24KPiAgIFJJU0MtVjogS1ZNOiBDaGVjayBhbmQgaW5q
ZWN0IG5lc3RlZCB2aXJ0dWFsIGludGVycnVwdHMKPiAgIFJJU0MtVjogS1ZNOiBFeHRlbmQga3Zt
X3Jpc2N2X2lzYV9jaGVja19ob3N0KCkgZm9yIG5lc3RlZCB2aXJ0Cj4gICBSSVNDLVY6IEtWTTog
VHJhcC1uLWVtdWxhdGUgU1JFVCBmb3IgR3Vlc3QgSFMtbW9kZQo+ICAgUklTQy1WOiBLVk06IFJl
ZGlyZWN0IG5lc3RlZCBzdXBlcnZpc29yIGVjYWxsIGFuZCBicmVha3BvaW50IHRyYXBzCj4gICBS
SVNDLVY6IEtWTTogUmVkaXJlY3QgbmVzdGVkIFdGSSBhbmQgV1JTIHRyYXBzCj4gICBSSVNDLVY6
IEtWTTogSW1wbGVtZW50IHJlbW90ZSBIRkVOQ0UgU0JJIGNhbGxzIGZvciBndWVzdAo+ICAgUklT
Qy1WOiBLVk06IEFkZCBDU1IgZW11bGF0aW9uIGZvciBuZXN0ZWQgdmlydHVhbGl6YXRpb24KPiAg
IFJJU0MtVjogS1ZNOiBBZGQgSEZFTkNFIGVtdWxhdGlvbiBmb3IgbmVzdGVkIHZpcnR1YWxpemF0
aW9uCj4gICBSSVNDLVY6IEtWTTogQWRkIE9ORV9SRUcgaW50ZXJmYWNlIGZvciBuZXN0ZWQgdmly
dHVhbGl6YXRpb24gc3RhdGUKPiAgIFJJU0MtVjogS1ZNOiBzZWxmdGVzdHM6IEFkZCBuZXN0ZWQg
dmlydCBzdGF0ZSB0byBnZXQtcmVnLWxpc3QgdGVzdAo+ICAgUklTQy1WOiBLVk06IEFkZCBPTkVf
UkVHIGludGVyZmFjZSBmb3IgbmVzdGVkIHZpcnR1YWxpemF0aW9uIENTUnMKPiAgIFJJU0MtVjog
S1ZNOiBzZWxmdGVzdHM6IEFkZCBuZXN0ZWQgdmlydCBDU1JzIHRvIGdldC1yZWctbGlzdCB0ZXN0
CgpQYXRjaGVzIDEtdG8tMyBhcmUgYWxyZWFkeSBtZXJnZWQgYXMgZml4ZXMuCgpRdWV1ZWQgcGF0
Y2hlcyA0LXRvLTkgZm9yIExpbnV4LTcuMQoKVGhhbmtzLApBbnVwCgo+Cj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3NyLmggICAgICAgICAgICAgICAgICB8ICAxNyArCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaW5zbi5oICAgICAgICAgICAgICAgICB8ICAgOSArCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oICAgICAgICAgICB8ICAgMiArCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICAgICAgICB8ICAyOSArLQo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV9pc2EuaCAgICAgICAgICAgICAgfCAgMjAgKwo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV9tbXUuaCAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdGxiLmggICAgICAgICAgICAgIHwgIDM3ICstCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfY29uZmlnLmggICAgICB8ICAyNSArKwo+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X25lc3RlZC5oICAgICAgfCAxNjMgKysrKysrKysKPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV90aW1lci5oICAgICAgIHwgICAxICsKPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdm1pZC5oICAgICAgICAgICAgIHwgICAxICsKPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgIHwgIDM2ICstCj4g
IGFyY2gvcmlzY3Yva3ZtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCj4g
IGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCj4g
IGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyAgICAgICAgICAgICAgICAgICB8ICAgNSArCj4g
IGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArCj4g
IGFyY2gvcmlzY3Yva3ZtL2lzYS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI1OSArKysr
KysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEzICstCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxOCArLQo+ICBhcmNoL3Jpc2N2L2t2bS90bGIuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMzUgKysrKystCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDExNyArKy0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9jb25maWcuYyAgICAg
ICAgICAgICAgICAgIHwgMTMwICsrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyAg
ICAgICAgICAgICAgICAgICAgfCAgNjIgKystCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfZnAuYyAg
ICAgICAgICAgICAgICAgICAgICB8ICAgOSArLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24u
YyAgICAgICAgICAgICAgICAgICAgfCAgNDYgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfbmVz
dGVkLmMgICAgICAgICAgICAgICAgICB8IDI1OCArKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdV9uZXN0ZWRfY3NyLmMgICAgICAgICAgICAgIHwgMzg5ICsrKysrKysrKysrKysrKysr
Kwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X25lc3RlZF9pbnNuLmMgICAgICAgICAgICAgfCAxNDAg
KysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X25lc3RlZF9zd3RsYi5jICAgICAgICAgICAg
fCAxNDYgKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgICAgICAg
ICAgICAgfCAzMzQgKysrLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMg
ICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9y
ZXBsYWNlLmMgICAgICAgICAgICAgfCAgNjMgKystCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdGlt
ZXIuYyAgICAgICAgICAgICAgICAgICB8ICAyNCArLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Zl
Y3Rvci5jICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdm1pZC5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMzICstCj4gIC4uLi9zZWxmdGVzdHMva3ZtL3Jp
c2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8IDEwNiArKysrLQo+ICAzNiBmaWxlcyBjaGFuZ2Vk
LCAyMjQ0IGluc2VydGlvbnMoKyksIDQxOSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2lzYS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X2NvbmZpZy5oCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X25lc3RlZC5oCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS9pc2EuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9rdm0vdmNwdV9jb25maWcuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9rdm0vdmNwdV9uZXN0ZWQuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9r
dm0vdmNwdV9uZXN0ZWRfY3NyLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfbmVzdGVkX2luc24uYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0v
dmNwdV9uZXN0ZWRfc3d0bGIuYwo+Cj4gLS0KPiAyLjQzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
