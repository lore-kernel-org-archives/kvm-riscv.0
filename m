Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4DFD730BC
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeIHJjdxObWgalRTu0D/KuZ87O8iNy8jaYpEQ30Mnu4=; b=thCFu3C8r6N5oA
	dq9vWe8knSzHT0CIQ8v4Gdw1Zis3p2p70FhboA+FFRKW/RSyxihA3LhpVwWocfigWwkhGYzWoFz4E
	ho7Kb/ZJUJfETjYUvke53u3+9AyUECciSxi1ZJyQT5o6sp2fECuz4C71io5UolUF02ksqoMe4zjFb
	A1wu4LHqqrHpJVrgAlEkgJ7Lc4xKRgPu6nroes7b0rs+wu1B88H+Prb+I2XDb4qQeRXUFrW6PHsEf
	D9lt1G0qZ2SZZumRPMLcw05c/jH6wH7TBFHjc59rlI4XZQK/iZLewu6weAzb3g9S+4949iLXlz603
	u+XvK76Qeal1XwBoFeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zcb-00000001gc2-3L9j;
	Fri, 03 Apr 2026 08:11:17 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZcY-00000001gar-34Wj
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 08:11:16 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-67e23011c93so614264eaf.3
        for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 01:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775203873; cv=none;
        d=google.com; s=arc-20240605;
        b=EjyX+UIa7XyOR+kgX1vgpwXKITANQTY03qIuanO9LHKYJeTQyCml7ujj4VJ6dr/YlD
         k9GjvXMUc33nQ6E5SHJbcIhMilsyFnRAk1/zfzSUCo1U4ehflbTzBtBvDp9y57kygoRH
         lqO3/4SBm0HuFQORTrZMsf4xs2naROwbkbSgquJuFnO4XI7UuG65Y/SHmW0ghoFCh3b6
         bSVwJdw2ybOwGQqtqyp/oWWqX2vSpf1h/RDF4RvuDt3WRlYffo8HzMo8b+8nr4ihw2sl
         NgexqOSunwg0jwXq/kd48x/lsnwJ3XsnyIyDLxKrmASyKooB+Co8j8U3DYHv8OOLRscz
         cuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRjWOMqK4PAlflmzYTeO4Htqmd6bJQ/bjreqx+Xjlfo=;
        fh=+B/7xQzbMwH3i3j2ZfX3tH296OEwZQlZX5/igTEkMfo=;
        b=PIMKFGg0H7dTaY7vhxrqkNjeHFJMDHrDH6/xl0HDASGHTuPPd3jmKZmIaM4L3T7M6I
         ZFATArEH9emW8qROGtis+RV0he/ljAWakhncoEFC5BqoAv+0Gn7wk8AeddsM6pauVC+w
         twYht496OQOIGHmr4kkfga0S1s19xYpKSFXX/01vP1muQp9wNFVkY0ceKu5NdPiaoUiQ
         /THyJRXsTYzbHT147SOBByIrr/qZmMzjLbjGLh/qSWLfcWsGk5tQyMAmtqcdGI1kziSD
         qQs6BXAS5buEP5Wiv4tq//SIJJl9G0Jdyn2lsvx97omIGEL0hrTJVXwADMx60QDnRuEJ
         zoLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775203873; x=1775808673; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRjWOMqK4PAlflmzYTeO4Htqmd6bJQ/bjreqx+Xjlfo=;
        b=N15WKhWPRDJNRMtuD24V7x1J0iyN2BTjdC8YdC+xWjnx43/fgMAG1wdsdWsrwOE2OO
         XncxOOt6Gyw8g9p16w5URVNF57ueVlbcJlM82DlUKbcxHm9gVIS8mtbSb1mdypF/8MR0
         F1q7GloYH1hpkRDpBvRYvXSFy0A/qIryyx0vrb3MVf029rmvKAFnUrYji5G6SZPIcD82
         U1HkoVaEUCBhaWPNg+hjkgQLNDpDXKXBwopQn46sQxprvY0OsEXmsDo4lxuUHy6Xf6/Z
         IdFfUiHQFhZjZvYqtwv6OmcRFriZW8uQX7PZarr78OCWp9ZfyjOYf9DBzjWfSQp+lD40
         AjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203873; x=1775808673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRjWOMqK4PAlflmzYTeO4Htqmd6bJQ/bjreqx+Xjlfo=;
        b=akMcDacmhclXkkVBjpAxlI3BHq1JTZRG7h1IURRCnQqdvZ22WPFk69yI2gVzCtWh8i
         VXvm+vau2GRJva2AGWO5QxvxEPD5cK9BDareqLsvbW/aEFMEPQNZQJC5UO+Sdrl/oy6C
         YaCc7S1pxx33ueTnGpR5rM3F35XyXVvH7rS2yBiaQSvAiHNCtm7ffhuchkMJQzni41Kj
         c2KKKnmr56tfdYhXHxZRkNIF8Th3pkvw9k7wDHorZhSGKOvQuq/D6EJsYQ6OxRoO20ml
         msckUeOAA7CwFDg1XKIkG+ADTpuuFz10Fde27n/2yDh+2tqk2O73VvU+iFRaYcPvstjy
         bxqw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9RLkzYxcmCuF6pZybnc3vnj/oSwWo47DmAWQQXEa6rkpNb8hELfN7gTki+BHuO3vgrPBpdnIHG4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGbVZFaC5qkq4n7NXanNXMQJ8vLw3Olu+mUaTPVdPHu6SK4OkP
	uUzkyW++/a+yjJC2cDBsjQkeJsiVCsjtlHZP5qw8Ghq3kR9ZgfeEyGmBvzPlnnJLTX9j23zC7Vi
	qhPHdxqzbsDVkvlr7jyOx4o8L49siVgfC/yqvDNCTaw==
X-Gm-Gg: ATEYQzwi6FhSRQkzmBNY8BE8m7cLpmrd68W4p8x1UfPxon/QAdU+u9UQf0wKfleFvcJ
	gPU16gXp91ND44o5bc26nFNEZ8l/GsbQ3HbZ47qXBEQZZqFH0VLcqDGX8pBliFk4LKw3yy3w2Cb
	IDowzFoOSTE2FIU0Il3E/DsObSANeiQqwuockwZ/rtN6WGkFMFPg3KGrZXq8w5Hx6aAKB2kgf90
	n/ql5ecnGoIMSWbZ5/SsmJ6nIY6oh+W0QwIEpqp3LY0wYaJDn2RJ40L94FJgPvz875SXV2V3GGA
	wzqQwLXjAlaXi0BN6ybs8anywQEKgCDQsOTeyFumiOz0pOZEdc2s2scYb7iBPLUK6665Kv0KEXC
	dfJe0/4hXbwTVteJkK3g/u0SoFQ==
X-Received: by 2002:a05:6820:1b0e:b0:67c:1fc7:daa6 with SMTP id
 006d021491bc7-6821d23811emr1112989eaf.10.1775203873468; Fri, 03 Apr 2026
 01:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2CibJNXJYxCvyofXC3CUpCT5KdricNt2aViRSYCOWrrA@mail.gmail.com>
 <20260403070719.64284-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260403070719.64284-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 13:41:02 +0530
X-Gm-Features: AQROBzAD30X1MIqnPsVPFD2GQtGyaDXu1bXGTiOYV05dRH1-FhidSwuL0L0jieE
Message-ID: <CAAhSdy08ZDHdXZJ0R6CpxGoKbMQ9c+FZrU0vW=iN6gq6A8BTBQ@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, corbet@lwn.net, guoren@kernel.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org, 
	radim.krcmar@oss.qualcomm.com, skhan@linuxfoundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011115_036879_D6FE651A 
X-CRM114-Status: GOOD (  39.77  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCAxMjozN+KAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gPj4KPiA+PiA+Pk9uIFRodSwgQXByIDIsIDIwMjYgYXQgNjo1M+KA
r1BNIDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4+ID4+Pgo+ID4+ID4+
PiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiA+PiA+Pj4K
PiA+PiA+Pj4gQWRkIGEgVk0gY2FwYWJpbGl0eSB0aGF0IGFsbG93cyB1c2Vyc3BhY2UgdG8gc2Vs
ZWN0IHRoZSBHLXN0YWdlIHBhZ2UgdGFibGUKPiA+PiA+Pj4gZm9ybWF0IGJ5IHNldHRpbmcgSEdB
VFAuTU9ERSBvbiBhIHBlci1WTSBiYXNpcy4KPiA+PiA+Pj4KPiA+PiA+Pj4gVXNlcnNwYWNlIGVu
YWJsZXMgdGhlIGNhcGFiaWxpdHkgdmlhIEtWTV9FTkFCTEVfQ0FQLCBwYXNzaW5nIHRoZSByZXF1
ZXN0ZWQKPiA+PiA+Pj4gSEdBVFAuTU9ERSBpbiBhcmdzWzBdLiBUaGUgcmVxdWVzdCBpcyByZWpl
Y3RlZCB3aXRoIC1FSU5WQUwgaWYgdGhlIG1vZGUgaXMKPiA+PiA+Pj4gbm90IHN1cHBvcnRlZCBi
eSB0aGUgaG9zdCwgYW5kIHdpdGggLUVCVVNZIGlmIHRoZSBWTSBoYXMgYWxyZWFkeSBiZWVuCj4g
Pj4gPj4+IGNvbW1pdHRlZCAoZS5nLiB2Q1BVcyBoYXZlIGJlZW4gY3JlYXRlZCBvciBhbnkgbWVt
c2xvdCBpcyBwb3B1bGF0ZWQpLgo+ID4+ID4+Pgo+ID4+ID4+PiBLVk1fQ0hFQ0tfRVhURU5TSU9O
KEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUpIHJldHVybnMgYSBiaXRtYXNrIG9mIHRoZQo+
ID4+ID4+PiBIR0FUUC5NT0RFIGZvcm1hdHMgc3VwcG9ydGVkIGJ5IHRoZSBob3N0Lgo+ID4+ID4+
Pgo+ID4+ID4+PiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGli
YWJhLmNvbT4KPiA+PiA+Pj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVz
QG9zcy5xdWFsY29tbS5jb20+Cj4gPj4gPj4+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KPiA+PiA+Pj4gLS0tCj4gPj4gPj4+ICBEb2N1bWVudGF0aW9uL3ZpcnQva3Zt
L2FwaS5yc3QgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiA+Pj4gIGFyY2gv
cmlzY3Yva3ZtL3ZtLmMgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKystLQo+ID4+ID4+
PiAgaW5jbHVkZS91YXBpL2xpbnV4L2t2bS5oICAgICAgIHwgIDEgKwo+ID4+ID4+PiAgMyBmaWxl
cyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+ID4+Pgo+ID4+
ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0IGIvRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4gPj4gPj4+IGluZGV4IDAzMjUxNjc4M2U5Ni4uOWQ3
ZjY5NThmYTgxIDEwMDY0NAo+ID4+ID4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2Fw
aS5yc3QKPiA+PiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4gPj4g
Pj4+IEBAIC04OTAyLDYgKzg5MDIsMzMgQEAgaGVscGZ1bCBpZiB1c2VyIHNwYWNlIHdhbnRzIHRv
IGVtdWxhdGUgaW5zdHJ1Y3Rpb25zIHdoaWNoIGFyZSBub3QKPiA+PiA+Pj4gIFRoaXMgY2FwYWJp
bGl0eSBjYW4gYmUgZW5hYmxlZCBkeW5hbWljYWxseSBldmVuIGlmIFZDUFVzIHdlcmUgYWxyZWFk
eQo+ID4+ID4+PiAgY3JlYXRlZCBhbmQgYXJlIHJ1bm5pbmcuCj4gPj4gPj4+Cj4gPj4gPj4+ICs3
LjQ3IEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUKPiA+PiA+Pj4gKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+ID4+PiArCj4gPj4gPj4+ICs6QXJjaGl0ZWN0dXJlczog
cmlzY3YKPiA+PiA+Pj4gKzpUeXBlOiBWTQo+ID4+ID4+PiArOlBhcmFtZXRlcnM6IGFyZ3NbMF0g
Y29udGFpbnMgdGhlIHJlcXVlc3RlZCBIR0FUUCBtb2RlCj4gPj4gPj4+ICs6UmV0dXJuczoKPiA+
PiA+Pj4gKyAgLSAwIG9uIHN1Y2Nlc3MuCj4gPj4gPj4+ICsgIC0gLUVJTlZBTCBpZiBhcmdzWzBd
IGlzIG91dHNpZGUgdGhlIHJhbmdlIG9mIEhHQVRQIG1vZGVzIHN1cHBvcnRlZCBieSB0aGUKPiA+
PiA+Pj4gKyAgICBoYXJkd2FyZS4KPiA+PiA+Pj4gKyAgLSAtRUJVU1kgaWYgdkNQVXMgaGF2ZSBh
bHJlYWR5IGJlZW4gY3JlYXRlZCBmb3IgdGhlIFZNLCBpZiB0aGUgVk0gaGFzIGFueQo+ID4+ID4+
PiArICAgIG5vbi1lbXB0eSBtZW1zbG90cy4KPiA+PiA+Pj4gKwo+ID4+ID4+PiArVGhpcyBjYXBh
YmlsaXR5IGFsbG93cyB1c2Vyc3BhY2UgdG8gZXhwbGljaXRseSBzZWxlY3QgdGhlIEhHQVRQIG1v
ZGUgZm9yCj4gPj4gPj4+ICt0aGUgVk0uIFRoZSBzZWxlY3RlZCBtb2RlIG11c3QgYmUgc3VwcG9y
dGVkIGJ5IGJvdGggS1ZNIGFuZCBoYXJkd2FyZS4gVGhpcwo+ID4+ID4+PiArY2FwYWJpbGl0eSBt
dXN0IGJlIGVuYWJsZWQgYmVmb3JlIGNyZWF0aW5nIGFueSB2Q1BVcyBvciBtZW1zbG90cy4KPiA+
PiA+Pj4gKwo+ID4+ID4+PiArSWYgdGhpcyBjYXBhYmlsaXR5IGlzIG5vdCBlbmFibGVkLCBLVk0g
d2lsbCBzZWxlY3QgdGhlIGRlZmF1bHQgSEdBVFAgbW9kZQo+ID4+ID4+PiArYXV0b21hdGljYWxs
eS4gVGhlIGRlZmF1bHQgaXMgdGhlIGhpZ2hlc3QgSEdBVFAuTU9ERSB2YWx1ZSBzdXBwb3J0ZWQg
YnkKPiA+PiA+Pj4gK2hhcmR3YXJlLgo+ID4+ID4+PiArCj4gPj4gPj4+ICtgYEtWTV9DSEVDS19F
WFRFTlNJT04oS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSlgYCByZXR1cm5zIGEgYml0bWFz
ayBvZgo+ID4+ID4+PiArSEdBVFAuTU9ERSB2YWx1ZXMgc3VwcG9ydGVkIGJ5IHRoZSBob3N0LiBB
IHJldHVybiB2YWx1ZSBvZiAwIGluZGljYXRlcyB0aGF0Cj4gPj4gPj4+ICt0aGUgY2FwYWJpbGl0
eSBpcyBub3Qgc3VwcG9ydGVkLiBTdXBwb3J0ZWQtbW9kZSBiaXRtYXNrIHVzZSBIR0FUUC5NT0RF
Cj4gPj4gPj4+ICtlbmNvZGluZ3MgYXMgZGVmaW5lZCBieSB0aGUgUklTQy1WIHByaXZpbGVnZWQg
c3BlY2lmaWNhdGlvbiwgc3VjaCBhcyBTdjM5eDQKPiA+PiA+Pj4gK2NvcnJlc3BvbmRzIHRvIEhH
QVRQLk1PREU9OCwgc28gdXNlcnNwYWNlIHNob3VsZCB0ZXN0IGJpdG1hc2sgJiBCSVQoOCkuCj4g
Pj4gPj4+ICsKPiA+PiA+Pj4gIDguIE90aGVyIGNhcGFiaWxpdGllcy4KPiA+PiA+Pj4gID09PT09
PT09PT09PT09PT09PT09PT0KPiA+PiA+Pj4KPiA+PiA+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZtLmMgYi9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gPj4gPj4+IGluZGV4IDRkODJhODg2
MTAyYy4uNWU4MmEzYWQzYWQwIDEwMDY0NAo+ID4+ID4+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
bS5jCj4gPj4gPj4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPiA+PiA+Pj4gQEAgLTIwMSw2
ICsyMDEsOSBAQCBpbnQga3ZtX3ZtX2lvY3RsX2NoZWNrX2V4dGVuc2lvbihzdHJ1Y3Qga3ZtICpr
dm0sIGxvbmcgZXh0KQo+ID4+ID4+PiAgICAgICAgIGNhc2UgS1ZNX0NBUF9WTV9HUEFfQklUUzoK
PiA+PiA+Pj4gICAgICAgICAgICAgICAgIHIgPSBrdm1fcmlzY3ZfZ3N0YWdlX2dwYV9iaXRzKGt2
bS0+YXJjaC5wZ2RfbGV2ZWxzKTsKPiA+PiA+Pj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4+
ID4+PiArICAgICAgIGNhc2UgS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERToKPiA+PiA+Pj4g
KyAgICAgICAgICAgICAgIHIgPSBrdm1fcmlzY3ZfZ2V0X2hnYXRwX21vZGVfbWFzaygpOwo+ID4+
ID4+PiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4gPj4KPiA+PiA+PkludHJvZHVjaW5nIGEg
bmV3IFJJU0MtViBjYXBhYmlsaXR5IGxvb2tzIGEgYml0IGNvbXBsZXguCj4gPj4gPj5JbnN0ZWFk
IG9mIEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUsIHdlIGNhbgo+ID4+ID4+c2ltcGx5IHJl
LXVzZSBLVk1fQ0FQX1ZNX0dQQV9CSVRTLgo+ID4+ID4+Cj4gPj4gPj5UaGUga3ZtX3ZtX2lvY3Rs
X2NoZWNrX2V4dGVuc2lvbigpIGZvciBLVk1fQ0FQX1ZNX0dQQV9CSVRTCj4gPj4gPj5yZXR1cm4g
bnVtYmVyIG9mIEdQQSBiaXRzIHdoaWNoIGluLWRpcmVjdGx5IGltcGxpZXMgdGhlIHVuZGVybHlp
bmcKPiA+PiA+PmhnYXRwLk1PREUuIEFzIHdlIGtub3csIGlmIGl0IHJldHVybiA1OSBiaXRzIEdQ
QSB0aGVuIGl0IG1lYW5zCj4gPj4gPj5TdjU3eDQgaXMgdGhlIHNlbGVjdGVkIGhnYXRwLk1PREUg
YW5kIFN2NDh4NCBhbmQgU3YzOXg0IG1vZGVzCj4gPj4gPj5hcmUgYWxzbyBzdXBwb3J0ZWQgYXMt
cGVyIFJJU0MtViBwcml2aWxlZ2VkIHNwZWNpZmljYXRpb24uCj4gPj4gPj4KPiA+PiA+PlRoZSBr
dm1fdm1faW9jdGxfZW5hYmxlX2NhcCgpIGZvciBLVk1fQ0FQX1ZNX0dQQV9CSVRTCj4gPj4gPj53
aWxsIHRha2UgdGhlIGRlc2lyZWQgbnVtYmVyIG9mIEdQQSBiaXRzIGFuZCBkb3duc2l6ZSB0aGUg
c2VsZWN0ZWQKPiA+PiA+PmhnYXRwLk1PREUuIEZvciBleGFtcGxlLCBpZiB1c2VyLXNwYWNlIGFz
ayBHUEEgYml0cyA8PSA1MCBhbmQKPiA+PiA+PkdQQSBiaXRzID4gNDEgdGhlbiB3ZSBzZWxlY3Qg
U3Y0OHg0LiBJZiB1c2VyLXNwYWNlIGFzayBHUEEKPiA+PiA+PmJpdHMgPD0gNDEgdGhlbiB3ZSBz
ZWxlY3QgU3YzOXg0LiBJZiB1c2VyLXNwYWNlIGFzayBHUEEgYml0cyA8PSA1OQo+ID4+ID4+YW5k
IEdQQSBiaXRzID4gNTAgdGhlbiB3ZSBzZWxlY3QgU3Y1N3g0Lgo+ID4+ID4+Cj4gPj4gPgo+ID4+
ID5UaGFua3MsIHRoYXQgbWFrZXMgc2Vuc2UuCj4gPj4gPgo+ID4+ID5JbiB2OCBJ4oCZbGwgZHJv
cCBLVk1fQ0FQX1JJU0NWX1NFVF9IR0FUUF9NT0RFIGFuZCByZS11c2UgS1ZNX0NBUF9WTV9HUEFf
QklUUwo+ID4+ID5mb3IgYm90aCBkaXNjb3ZlcnkgYW5kIHNlbGVjdGlvbi4KPiA+PiA+Cj4gPj4K
PiA+PiBIaSBBbnVwLAo+ID4+Cj4gPj4gV2hpbGUgd29ya2luZyBvbiB0aGUgcmVzcGluIHJldXNp
bmcgS1ZNX0NBUF9WTV9HUEFfQklUUywgSSByZWFsaXplZAo+ID4+IGEgcG90ZW50aWFsIGFtYmln
dWl0eSBpbiBDSEVDS19FWFRFTlNJT04gc2VtYW50aWNzIGFuZCB3YW50ZWQgdG8gY29uZmlybSB0
aGUKPiA+PiBpbnRlbmRlZCBBQkkgYmVmb3JlIHBvc3RpbmcgdjguCj4gPj4KPiA+PiBPbmUgY29u
Y2VybiBhYm91dCB0aGUgc2VtYW50aWNzOiB0b2RheSBLVk1fQ0hFQ0tfRVhURU5TSU9OKEtWTV9D
QVBfVk1fR1BBX0JJVFMpCj4gPj4gb24gYSBWTSBmZCBtYXkgYmUgaW50ZXJwcmV0ZWQgYXMg4oCc
dGhlIEdQQSBiaXRzIGZvciB0aGlzIFZN4oCdIChvciBhdCBsZWFzdCB3aGF0Cj4gPj4gdGhpcyBW
TSBjYW4gdXNlKS4gSWYgd2UgYWxzbyB1c2UgS1ZNX0VOQUJMRV9DQVAoS1ZNX0NBUF9WTV9HUEFf
QklUUykgdG8gZG93bnNpemUKPiA+PiB0aGUgc2VsZWN0ZWQgSEdBVFAuTU9ERSBmb3IgYSBwYXJ0
aWN1bGFyIFZNIChlLmcuIHRvIFN2NDh4NCA9PiA1MCBiaXRzKSwgdGhlbiBhCj4gPj4gc3Vic2Vx
dWVudCBDSEVDS19FWFRFTlNJT04oS1ZNX0NBUF9WTV9HUEFfQklUUykgb24gdGhlIHNhbWUgVk0g
ZmQgd291bGQgcmV0dXJuIDUwLgo+ID4+IFVzZXJzcGFjZSBtaWdodCB0aGVuIGFzc3VtZSA1MCBp
cyB0aGUgbWF4aW11bSBzdXBwb3J0ZWQgYnkgdGhhdCBWTS9ob3N0IGFuZCBsb3NlCj4gPj4gdGhl
IGluZm9ybWF0aW9uIHRoYXQgdGhlIGhvc3QgYWN0dWFsbHkgc3VwcG9ydHMgNTkgKFN2NTd4NCku
Cj4gPgo+ID5JIHRoaW5rIHRoZXJlIGlzIG5vIHZpb2xhdGlvbiBvZiB0aGUgc2VtYW50aWNzIGJl
Y2F1c2Ugd2UgYXJlIHByb3ZpZGluZwo+ID5hIHdheSB0byBhbGxvdyBLVk0gdXNlciBzcGFjZSBj
aGFuZ2UgInRoZSBHUEEgYml0cyBmb3IgdGhpcyBWTeKAnQo+ID51c2luZyBLVk1fRU5BQkxFX0NB
UChLVk1fQ0FQX1ZNX0dQQV9CSVRTKSBzbyBzdWJzZXF1ZW50Cj4gPkNIRUNLX0VYVEVOU0lPTihL
Vk1fQ0FQX1ZNX0dQQV9CSVRTKSBtdXN0IHJldHVybgo+ID5lZmZlY3RpdmUgbnVtYmVyIG9mIEdQ
QSBiaXRzIHZpc2libGUgdG8gdGhlIFZNLgo+Cj4gVGhhbmtzLCBhZ3JlZWQuCj4KPiA+VGhlIG9u
bHkgYWRkaXRpb25hbCBjb25zdHJhaW50IEkgd291bGQgZW5mb3JjZSBpcyB0aGF0IHRoZQo+ID5L
Vk1fRU5BQkxFX0NBUChLVk1fQ0FQX1ZNX0dQQV9CSVRTKSBtdXN0Cj4gPnJldHVybiAtRUJVU1kg
aWYgYW55IG9mIHRoZSBHdWVzdCBWQ1BVcyBoYXZlCj4gPnJhbl9hdGxlYXN0X29uY2Ugc2V0Lgo+
ID4KPgo+IEluIG15IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gSSBhbHJlYWR5IHJldHVybiAtRUJV
U1kgaWYga3ZtLT5jcmVhdGVkX3ZjcHVzCj4gaXMgbm9uLXplcm8sIGkuZS4gdGhlIEdQQSBiaXRz
IGNhbiBvbmx5IGJlIGNoYW5nZWQgYmVmb3JlIGFueSB2Q1BVIGlzIGNyZWF0ZWQuCgpDaGVja2lu
ZyBrdm0tPmNyZWF0ZWRfdmNwdXMgaXMgcGVyZmVjdGx5IGZpbmUgc28gbm8gbmVlZCB0byBjaGFu
Z2UgdGhpcy4KClJlZ2FyZHMsCkFudXAKCj4KPiBUaGFua3MsCj4gRmFuZ3l1Cj4KPiA+UmVnYXJk
cywKPiA+QW51cAo+ID4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiBGYW5neXUKPiA+Pgo+ID4+ID5U
aGFua3MsCj4gPj4gPkZhbmd5dQo+ID4+ID4KPiA+PiA+Pj4gICAgICAgICBkZWZhdWx0Ogo+ID4+
ID4+PiAgICAgICAgICAgICAgICAgciA9IDA7Cj4gPj4gPj4+ICAgICAgICAgICAgICAgICBicmVh
azsKPiA+PiA+Pj4gQEAgLTIxMSwxMiArMjE0LDIzIEBAIGludCBrdm1fdm1faW9jdGxfY2hlY2tf
ZXh0ZW5zaW9uKHN0cnVjdCBrdm0gKmt2bSwgbG9uZyBleHQpCj4gPj4gPj4+Cj4gPj4gPj4+ICBp
bnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9jYXAoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2Vu
YWJsZV9jYXAgKmNhcCkKPiA+PiA+Pj4gIHsKPiA+PiA+Pj4gKyAgICAgICBpZiAoY2FwLT5mbGFn
cykKPiA+PiA+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4+ID4+PiArCj4g
Pj4gPj4+ICAgICAgICAgc3dpdGNoIChjYXAtPmNhcCkgewo+ID4+ID4+PiAgICAgICAgIGNhc2Ug
S1ZNX0NBUF9SSVNDVl9NUF9TVEFURV9SRVNFVDoKPiA+PiA+Pj4gLSAgICAgICAgICAgICAgIGlm
IChjYXAtPmZsYWdzKQo+ID4+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiA+PiA+Pj4gICAgICAgICAgICAgICAgIGt2bS0+YXJjaC5tcF9zdGF0ZV9yZXNldCA9
IHRydWU7Cj4gPj4gPj4+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+PiA+Pj4gKyAgICAg
ICBjYXNlIEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREU6Cj4gPj4gPj4+ICsgICAgICAgICAg
ICAgICBpZiAoIWt2bV9yaXNjdl9oZ2F0cF9tb2RlX2lzX3ZhbGlkKGNhcC0+YXJnc1swXSkpCj4g
Pj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4+ID4+PiAr
Cj4gPj4gPj4+ICsgICAgICAgICAgICAgICBpZiAoa3ZtLT5jcmVhdGVkX3ZjcHVzIHx8ICFrdm1f
YXJlX2FsbF9tZW1zbG90c19lbXB0eShrdm0pKQo+ID4+ID4+PiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVCVVNZOwo+ID4+ID4+PiArI2lmZGVmIENPTkZJR182NEJJVAo+ID4+ID4+
PiArICAgICAgICAgICAgICAga3ZtLT5hcmNoLnBnZF9sZXZlbHMgPSAzICsgY2FwLT5hcmdzWzBd
IC0gSEdBVFBfTU9ERV9TVjM5WDQ7Cj4gPj4gPj4+ICsjZW5kaWYKPiA+PiA+Pj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+ID4+ID4+PiAgICAgICAgIGRlZmF1bHQ6Cj4gPj4gPj4+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+PiA+Pj4gICAgICAgICB9Cj4gPj4gPj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmggYi9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtLmgKPiA+PiA+Pj4gaW5kZXggODAzNjRkNGRiZWJiLi5hNzRhODBmZDQwNDYgMTAwNjQ0Cj4g
Pj4gPj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaAo+ID4+ID4+PiArKysgYi9pbmNs
dWRlL3VhcGkvbGludXgva3ZtLmgKPiA+PiA+Pj4gQEAgLTk4OSw2ICs5ODksNyBAQCBzdHJ1Y3Qg
a3ZtX2VuYWJsZV9jYXAgewo+ID4+ID4+PiAgI2RlZmluZSBLVk1fQ0FQX0FSTV9TRUFfVE9fVVNF
UiAyNDUKPiA+PiA+Pj4gICNkZWZpbmUgS1ZNX0NBUF9TMzkwX1VTRVJfT1BFUkVYRUMgMjQ2Cj4g
Pj4gPj4+ICAjZGVmaW5lIEtWTV9DQVBfUzM5MF9LRVlPUCAyNDcKPiA+PiA+Pj4gKyNkZWZpbmUg
S1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSAyNDgKPiA+PiA+Pj4KPiA+PiA+Pj4gIHN0cnVj
dCBrdm1faXJxX3JvdXRpbmdfaXJxY2hpcCB7Cj4gPj4gPj4+ICAgICAgICAgX191MzIgaXJxY2hp
cDsKPiA+PiA+Pj4gLS0KPiA+PiA+Pj4gMi41MC4xCj4gPj4gPj4+Cj4gPj4gPj4KPiA+PiA+PlJl
Z2FyZHMsCj4gPj4gPj5BbnVwCj4gPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
