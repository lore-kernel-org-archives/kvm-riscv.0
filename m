From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 13 Jan 2023 08:42:04 +0100
Subject: [PATCH v2 04/11] RISC-V: KVM: Modify SBI extension handler to
 return SBI error code
In-Reply-To: <CAHBxVyEyMdk+vQ5wTgOF56UJs-zLtkVixDxXquTjoLyV6Vj21Q@mail.gmail.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-5-atishp@rivosinc.com>
 <20230112110444.jjbmgslr6dspxwbh@orel>
 <CAHBxVyEyMdk+vQ5wTgOF56UJs-zLtkVixDxXquTjoLyV6Vj21Q@mail.gmail.com>
Message-ID: <20230113074204.p3wmeer2o3penunt@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 10:47:13AM -0800, Atish Kumar Patra wrote:
> On Thu, Jan 12, 2023 at 3:04 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Dec 15, 2022 at 09:00:39AM -0800, Atish Patra wrote:
...
> > > +      * and forwards the error to the userspace.
> > > +      */
> > > +     if (ret < 0) {
> > > +             next_sepc = false;
> > > +             goto ecall_done;
> > > +     }
> >
> > Shouldn't this ret < 0 check go above the "Handle special error cases..."
> > block?
> >
> 
> Why ? I thought if an extension handler has both utrap updated and
> returns an error,
> user space redirection should take precedence. Let me know if it is wrong.

My thinking was that utrap cannot be trusted if the handler returned an
error. The handler may not even have had a chance to set it before hitting
the error condition. IOW, we should check 'ret' right after the handler
call. If it's < 0, then from the caller's perspective the handler didn't
execute due to a KVM failure and it should be reported to userspace.

Thanks,
drew

