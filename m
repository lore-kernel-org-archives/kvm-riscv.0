Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B982EC54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pgU8I8UR4U4aVtTLc9Nt3vKLgkrk3neVD2Ul39vCk4=; b=GaG+iD2zJPVdPD
	Nj6M8uM2XE5WrQSWzqV4o3A9sMqImq0NPa2bA1PBR3AAdNgrsw918JkfRVuzlE4rloDioYCAaZ+my
	z4cr5IqlLSrcOiT6c4OnIOy0BhwVUfVPDu4dkUUIbwBvVD5aZp5TzwgzrWwB463YKDWRun+YuWgBI
	IVBw3aPbAHsorunvspw1HWz+ND8KpU8a+Y0n5WAyVKUGnFtxGhAtpk2R8TRKOLrTsj3d8rZ7tr1ZO
	LWdrD2BWm8InK9FfpKM5mmD5uX6Y9Sc+gUR7YN9iBsbvVhVriCPiN/rTMT/LBKLoAh6UjhsuB2DHI
	Oy+bv0fagx8m3d43qKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3ej-00000007wrK-1jKP;
	Wed, 29 Jul 2026 12:45:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3eg-00000007wq5-407M
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:45:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1351293f8f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329101; cv=none;
        d=google.com; s=arc-20260327;
        b=VHAL8UtG4udvJ8ub8tQgXcB7pCnGx/Ir99t4nuzYgsBldWOIvdmMH5yjJ6sSiktphQ
         IiAIvKvGhW8xab4tVWfRlrRhKJbYjSlSQK57uWqZKKYZQmYT6xYV6XJ/fWvuRRnd2iZ0
         DWk7S4tzGuF4JTdEqNXIdjQ4tIHub1kUvhwTR2R4HlQciovv0/hvImW4Nt4dr9qqk6pv
         l1NuyH1qViiiBmRMpWyzlTLcKIjNv3p+va5ZDOSl4oYzKVJn11uUXjfE7oL78kkuiACJ
         UO4c/vLPFwsk4hBgge4dSfLPFJee4clK/p7DrvDDxBZzJWoLQHtL3FEaUQ2EEHvZzWpL
         5P4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iMeNu4+os+LxYP0wqrGsNdF408ZfmMDEahTjLviYQ3s=;
        fh=MlllCcrVb4IxkqgIAwJ7jyd11BMGOoNEohGLoHI6VtM=;
        b=bbBQ5Fl/8klCabDBMkjyp+Wnr5H8rhzrzOEO9R+MdrG4/xqI73eGyuMaPVQ5LMVokh
         QttSBQhnjtGCMRKKJlSR8L474/6DdLWYZ9fd7fBQvaAyqxzwhgumvyvwBUq0Eeq6QiQq
         mjHywCVyxlZbjdgFxWAkAGv7EhsKaDyryWNlTIbgfhBKzotzANM/PetcT7qRn3W13VWj
         I7xhLCJ9BfqVk4Py1EvG5j72+O1RCFADsR8coLS5y8V7LWaZXnY7Sfbrw39cYFDCXllI
         Pog2x0gMPtvtSWaBh+JdIFlVp+S4R1Fcz+5bTNBAufh2Kxk5CFz1vcNdSi9vdLxYA3PY
         iddg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785329101; x=1785933901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMeNu4+os+LxYP0wqrGsNdF408ZfmMDEahTjLviYQ3s=;
        b=Sd++k3D/NaX9QGyJKnOrSzyE0XJD/89hibh78N1blH2OxFhXn+Tb/Sm5mJCS22TrGV
         +seJIeJtpgd9USVARCzKkqcRuXAYYrJ7KXVj/+sx+FVgJBD4QqjQuF4yO69PMlBiC8Sa
         9x/p8vV5gSwHFwUc2fanwPMPPG9WeKl3dTr8S7XvnZi7DKkfweGqzIDHGGTAD/3dmJ0J
         XB3bYElvNQsO8trUOX1bp4CHwb5AI8eidES5nssB5KnhTvwwmzzeaJIaL/+ZM5EmFL6w
         cxpLiZicAZbjxM9TT9N321y0UbV1+pG19AkXb2WNJHuMtUDh7qTl566w53BNF0rPy2CQ
         i1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329101; x=1785933901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMeNu4+os+LxYP0wqrGsNdF408ZfmMDEahTjLviYQ3s=;
        b=K1mv63NLL/UvLqCQWWlwtJ9DPLhgo7779e2/UoFrjoHciQ0TgL+p2Q4ZOqoMlqogSg
         NLeS9wikFpTbHGqffMjGfBNMsLbDJava45gjQ/mEsNKZRZoB3ltJulJq7s3H9usgKvh3
         bYnD3Xu6jh5aXlIjsVvjCdnMYr1tBG8T66AG17apwoHFS+J+ZHwdRZPRm5/HD69etNik
         w/7YQeZMPV+XuOmuBaz5a/D+u0IF0PYYEwpM3YNUv91ckCv2Vi/jYe0X+OEH7j7gYeBn
         g60wIzovCg5Zyy7S4bor3P5/QTdPss+QrGvTKvR0n29wjK77lPNGYUsTEMdF2dnwj5JW
         srVw==
X-Forwarded-Encrypted: i=1; AHgh+RpejdzXD0gsyJf+WM/Qj8mjza8NkMbDSFPFaa59mR6gNEQRQi6mabrWcToXkeH95ke6zrYo4URYZbQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkhYU3ZybhOWEtEjlRo1jNj0JjTy/lLgIReTMFhSGuzAr25bTc
	t0xLkHBCqbncWNmrgiJtVdV9hzUWqCIvaNs83pYEFONMmpazlOIVxGlTfeAZMQIPLgEcyxH3N0L
	EX66uvt2ehNLgZa33dCpFpan9NcK2ws92w0okNEPRqQ==
X-Gm-Gg: AR+sD10ytxXThs/yobZWDCm4WDKKDbybVEDx6oRd0nZ5Dd09ENtZNWf/w0mB99WC3rO
	AJM3pUOpr96fowktUXoqFHrH2OPRKPB4+T1+p8DPzEXcX73XoUzh5ILcKqQEac/0ktvOMGdfZz1
	o2FNWBojGjtz3fUkfz15/iqrAEuhnVarBdy/ZjgjKP2larP0ZDC4spUHVTxnQTlYnnuuv0LshHj
	IAc66QfkRtVANdjOGZiuRQ1xsf4OqsokrPwqPwqEfCLGDRSWWE0dLc87/Dsnu5jbSI0Vmj462ae
	5m9uLvvoJU0RDK4hg/2Ul5nTkjZDww0+kCEPp1pr6AR9rqOb/1gKIu4hQ7MS0jGiXeazZYHKWhl
	VaHyOGeusygtu1DXujKR5vncUq3GzjyHfX94lF4GyZ1DfMZPiB05fVAutwdECrLE=
X-Received: by 2002:a05:6000:4b03:b0:47f:7ea0:6c20 with SMTP id
 ffacd0b85a97d-47fbabdeba5mr3222037f8f.15.1785329101087; Wed, 29 Jul 2026
 05:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-3-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-3-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:14:49 +0530
X-Gm-Features: AUfX_mw9Geq8pnQB8DXZRWmbfgR1VWYBcvVSDUq0mH-M8_MwEEaJfPpEFqa2qBs
Message-ID: <CAAhSdy0nPJAkkZM07D0Xm0Sd6tB7D2MK1aYvWZk0Mn4MbnNKjQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] KVM: riscv: selftests: add Svadu FWFT extension to
 get-reg-list test
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_054503_021503_50206614 
X-CRM114-Status: GOOD (  14.69  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozM+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIEtWTSBSSVNDLVYgYWxsb3dzIFN2YWR1IEZXRlQg
Zm9yIEd1ZXN0L1ZNIHNvIGFkZCB0aGlzIGV4dGVuc2lvbgo+IHRvIGdldC1yZWctbGlzdCB0ZXN0
Lgo+Cj4gQXNzaXN0ZWQtYnk6IFl1YW5TaGVuZzpjbGF1ZGUtNC43LW9wdXMKPiBDby1kZXZlbG9w
ZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTog
UXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkg
QW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICAuLi4vc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAyMSArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gaW5kZXggY2I4
NmNiNmIzNjM1Li45NGUzM2IyZWU3OTYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gQEAgLTc0NSw2ICs3NDUsOSBAQCBzdGF0
aWMgY29uc3QgY2hhciAqc2JpX2Z3ZnRfaWRfdG9fc3RyKF9fdTY0IHJlZ19vZmYpCj4gICAgICAg
ICBjYXNlIDM6IHJldHVybiAiS1ZNX1JFR19SSVNDVl9TQklfRldGVCB8IEtWTV9SRUdfUklTQ1Zf
U0JJX0ZXRlRfUkVHKHBvaW50ZXJfbWFza2luZy5lbmFibGUpIjsKPiAgICAgICAgIGNhc2UgNDog
cmV0dXJuICJLVk1fUkVHX1JJU0NWX1NCSV9GV0ZUIHwgS1ZNX1JFR19SSVNDVl9TQklfRldGVF9S
RUcocG9pbnRlcl9tYXNraW5nLmZsYWdzKSI7Cj4gICAgICAgICBjYXNlIDU6IHJldHVybiAiS1ZN
X1JFR19SSVNDVl9TQklfRldGVCB8IEtWTV9SRUdfUklTQ1ZfU0JJX0ZXRlRfUkVHKHBvaW50ZXJf
bWFza2luZy52YWx1ZSkiOwo+ICsgICAgICAgY2FzZSA2OiByZXR1cm4gIktWTV9SRUdfUklTQ1Zf
U0JJX0ZXRlQgfCBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZUX1JFRyhwdGVfYWRfaHdfdXBkYXRpbmcu
ZW5hYmxlKSI7Cj4gKyAgICAgICBjYXNlIDc6IHJldHVybiAiS1ZNX1JFR19SSVNDVl9TQklfRldG
VCB8IEtWTV9SRUdfUklTQ1ZfU0JJX0ZXRlRfUkVHKHB0ZV9hZF9od191cGRhdGluZy5mbGFncyki
Owo+ICsgICAgICAgY2FzZSA4OiByZXR1cm4gIktWTV9SRUdfUklTQ1ZfU0JJX0ZXRlQgfCBLVk1f
UkVHX1JJU0NWX1NCSV9GV0ZUX1JFRyhwdGVfYWRfaHdfdXBkYXRpbmcudmFsdWUpIjsKPiAgICAg
ICAgIH0KPiAgICAgICAgIHJldHVybiBzdHJkdXBfcHJpbnRmKCJLVk1fUkVHX1JJU0NWX1NCSV9G
V0ZUIHwgJWxsZCAvKiBVTktOT1dOICovIiwgcmVnX29mZik7Cj4gIH0KPiBAQCAtOTQ0LDYgKzk0
NywxMyBAQCBzdGF0aWMgX191NjQgc2JpX2Z3ZnRfcG9pbnRlcl9tYXNraW5nX3JlZ3NbXSA9IHsK
PiAgICAgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVUxPTkcgfCBLVk1fUkVHX1JJ
U0NWX1NCSV9TVEFURSB8IEtWTV9SRUdfUklTQ1ZfU0JJX0ZXRlQgfCBLVk1fUkVHX1JJU0NWX1NC
SV9GV0ZUX1JFRyhwb2ludGVyX21hc2tpbmcudmFsdWUpLAo+ICB9Owo+Cj4gK3N0YXRpYyBfX3U2
NCBzYmlfZndmdF9wdGVfYWRfaHdfdXBkYXRpbmdfcmVnc1tdID0gewo+ICsgICAgICAgS1ZNX1JF
R19SSVNDViB8IEtWTV9SRUdfU0laRV9VTE9ORyB8IEtWTV9SRUdfUklTQ1ZfU0JJX0VYVCB8IEtW
TV9SRUdfUklTQ1ZfU0JJX1NJTkdMRSB8IEtWTV9SSVNDVl9TQklfRVhUX0ZXRlQsCj4gKyAgICAg
ICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklf
U1RBVEUgfCBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZUIHwgS1ZNX1JFR19SSVNDVl9TQklfRldGVF9S
RUcocHRlX2FkX2h3X3VwZGF0aW5nLmVuYWJsZSksCj4gKyAgICAgICBLVk1fUkVHX1JJU0NWIHwg
S1ZNX1JFR19TSVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklfU1RBVEUgfCBLVk1fUkVHX1JJ
U0NWX1NCSV9GV0ZUIHwgS1ZNX1JFR19SSVNDVl9TQklfRldGVF9SRUcocHRlX2FkX2h3X3VwZGF0
aW5nLmZsYWdzKSwKPiArICAgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVUxPTkcg
fCBLVk1fUkVHX1JJU0NWX1NCSV9TVEFURSB8IEtWTV9SRUdfUklTQ1ZfU0JJX0ZXRlQgfCBLVk1f
UkVHX1JJU0NWX1NCSV9GV0ZUX1JFRyhwdGVfYWRfaHdfdXBkYXRpbmcudmFsdWUpLAo+ICt9Owo+
ICsKPiAgc3RhdGljIF9fdTY0IHppY2JvbV9yZWdzW10gPSB7Cj4gICAgICAgICBLVk1fUkVHX1JJ
U0NWIHwgS1ZNX1JFR19TSVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9DT05GSUcgfCBLVk1fUkVH
X1JJU0NWX0NPTkZJR19SRUcoemljYm9tX2Jsb2NrX3NpemUpLAo+ICAgICAgICAgS1ZNX1JFR19S
SVNDViB8IEtWTV9SRUdfU0laRV9VTE9ORyB8IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9S
RUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJQ0JPTSwKPiBAQCAtMTI1
OSw2ICsxMjY5LDE2IEBAIHN0YXRpYyBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCBjb25maWdfc2JpX2Z3
ZnRfcG9pbnRlcl9tYXNraW5nID0gewo+ICAgICAgICAgfSwKPiAgfTsKPgo+ICtzdGF0aWMgc3Ry
dWN0IHZjcHVfcmVnX2xpc3QgY29uZmlnX3NiaV9md2Z0X3B0ZV9hZF9od191cGRhdGluZyA9IHsK
PiArICAgICAgIC5zdWJsaXN0cyA9IHsKPiArICAgICAgICAgICAgICAgU1VCTElTVF9CQVNFLAo+
ICsgICAgICAgICAgICAgICBTVUJMSVNUX0lTQShzdmFkZSwgU1ZBREUpLAo+ICsgICAgICAgICAg
ICAgICBTVUJMSVNUX0lTQShzdmFkdSwgU1ZBRFUpLAo+ICsgICAgICAgICAgICAgICBTVUJMSVNU
X1NCSShmd2Z0X3B0ZV9hZF9od191cGRhdGluZywgRldGVCksCj4gKyAgICAgICAgICAgICAgIHsw
fSwKPiArICAgICAgIH0sCj4gK307Cj4gKwo+ICBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9j
b25maWdzW10gPSB7Cj4gICAgICAgICAmY29uZmlnX3NiaV9iYXNlLAo+ICAgICAgICAgJmNvbmZp
Z19zYmlfc3RhLAo+IEBAIC0xMjY4LDYgKzEyODgsNyBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAq
dmNwdV9jb25maWdzW10gPSB7Cj4gICAgICAgICAmY29uZmlnX3NiaV9tcHh5LAo+ICAgICAgICAg
JmNvbmZpZ19zYmlfZndmdF9taXNhbGlnbmVkX2RlbGVnLAo+ICAgICAgICAgJmNvbmZpZ19zYmlf
ZndmdF9wb2ludGVyX21hc2tpbmcsCj4gKyAgICAgICAmY29uZmlnX3NiaV9md2Z0X3B0ZV9hZF9o
d191cGRhdGluZywKPiAgICAgICAgICZjb25maWdfYWlhLAo+ICAgICAgICAgJmNvbmZpZ19mcF9m
LAo+ICAgICAgICAgJmNvbmZpZ19mcF9kLAo+IC0tCj4gMi41NS4wCj4KCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
