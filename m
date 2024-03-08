From: Sean Christopherson <seanjc@google.com>
Date: Fri, 8 Mar 2024 07:40:42 -0800
Subject: [GIT PULL] KVM/riscv changes for 6.9
In-Reply-To: <CAAhSdy2Mu08RsBM+7FMjkcV49p9gOj3UKEoZnPAVk92e_3q=sw@mail.gmail.com>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com> <CAAhSdy2Mu08RsBM+7FMjkcV49p9gOj3UKEoZnPAVk92e_3q=sw@mail.gmail.com>
Message-ID: <ZesxeoyFZUeo-Z9F@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 08, 2024, Anup Patel wrote:
> On Thu, Mar 7, 2024 at 11:13?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Thu, Mar 07, 2024, Anup Patel wrote:
> > > ----------------------------------------------------------------
> > > KVM/riscv changes for 6.9
> > Uh, what's going on with this series?  Many of these were committed *yesterday*,
> > but you sent a mail on February 12th[1] saying these were queued.  That's quite
> > the lag.
> >
> > I don't intend to police the RISC-V tree, but this commit caused a conflict with
> > kvm-x86/selftests[2].  It's a non-issue in this case because it's such a trivial
> > conflict, and we're all quite lax with selftests, but sending a pull request ~12
> > hours after pushing commits that clearly aren't fixes is a bit ridiciulous.  E.g.
> > if this were to happen with a less trivial conflict, the other sub-maintainer would
> > be left doing a late scramble to figure things out just before sending their own
> > pull requests.
> >
> >   tag kvm-riscv-6.9-1
> >   Tagger:     Anup Patel <anup@brainfault.org>
> >   TaggerDate: Thu Mar 7 11:54:34 2024 +0530
> >
> > ...
> >
> >   commit d8c0831348e78fdaf67aa95070bae2ef8e819b05
> >   Author:     Anup Patel <apatel@ventanamicro.com>
> >   AuthorDate: Tue Feb 13 13:39:17 2024 +0530
> >   Commit:     Anup Patel <anup@brainfault.org>
> >   CommitDate: Wed Mar 6 20:53:44 2024 +0530
> >
> > The other reason this caught my eye is that the conflict happened in common code,
> > but the added helper is RISC-V specific and used only from RISC-V code.  ARM does
> > have an identical helper, but AFAICT ARM's helper is only used from ARM code.
> >
> > But the prototype of guest_get_vcpuid() is in common code.  Which isn't a huge
> > deal, but it's rather undesirable because there's no indication that its
> > implementation is arch-specific, and trying to use it in code built for s390 or
> > x86 (or MIPS or PPC, which are on the horizon), would fail.  I'm all for making
> > code common where possible, but going halfway and leaving a trap for other
> > architectures makes for a poor experience for developers.
> >
> > And again, this showing up _so_ late means it's unnecessarily difficult to clean
> > things up.  Which is kinda the whole point of getting thing into linux-next, so
> > that folks that weren't involved in the original patch/series can react if there
> > is a hiccup/problem/oddity.
> 
> Sorry for the last minute conflict.
> 
> In all release cycles, the riscv_kvm_queue freezes by rc6 and riscv_kvm_next
> is updated at least a week before sending PR.
> 
> In this case there was a crucial last minute bug found in RISC-V arch_timer
> selftest patches due to which the get-reg-list selftest was broken so I
> updated the offending commits in the queue itself before sending out PR.
> 
> I will definitely try my best to avoid such last minute conflict.

You're missing the point.  I don't care when patches land in the RISC-V tree, nor
do I care that you made a last minute tweak to fix a bug.  I care when commits
show up in linux-next, and *none* of these commits were in linux-next until
yesterday.

  $ git tag -l --contains 2c5af1c8460376751d57c50af88a053a3b869926
  next-20240307
  next-20240308

The *entire* purpose of linux-next is to integrate *all* work destined for the
next kernel into a single tree, so that conflicts, bugs, etc. can be found and
fixed *before* the next merge window.

Commits should be getting pushed to riscv_kvm_next, i.e. pulled by linux-next,
the instant you are confident they are "stable" and unlikely to be amended.  The
entire RISC-V KVM tree showing up in linux-next a week before the merge window
opens is *way* too late.

From Documentation/process/howto.rst:

  - As soon as a new kernel is released a two week window is open,
    during this period of time maintainers can submit big diffs to
    Linus, usually the patches that have already been included in the
    linux-next for a few weeks. 

...

  linux-next integration testing tree
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  Before updates from subsystem trees are merged into the mainline tree,
  they need to be integration-tested.  For this purpose, a special
  testing repository exists into which virtually all subsystem trees are
  pulled on an almost daily basis:
  
  	https://git.kernel.org/?p=linux/kernel/git/next/linux-next.git
  
  This way, the linux-next gives a summary outlook onto what will be
  expected to go into the mainline kernel at the next merge period.
  Adventurous testers are very welcome to runtime-test the linux-next.
  
The fact that your tree is based on -rc6 means your entire workflow is flawed.
There is almost never a need to to use a release candidate later than -rc2 as
the base, as the odds of there being a fix in Linus' tree aftern -rc2 that is
*absolutely necessary* for testing KVM are vanishingly small.

And given that these were "queued" on February 12th, but are now based on -rc6,
means that you reparented them at least once.  Rebasing/reparenting is explicitly
documented as a Bad Idea?, because for all intents and purposes rebasing creates
a completely new commit, and thus invalidates much of the testing that was done
on the prior incarnation of the branch/commits.

E.g. if you make a mistake when rebasing a patch and introduce a bug, bisect will
point to the rebased commit, despite the fact that as *submitted* and originally
applied, the patch was correct.  But if you (or more likely Paolo or Linus) make
the same mistake when merging the branch, bisect will point at the merge commit.
That is a huge difference, as it pinpoints that the problem wasn't with the patch
itself, but instead with how it was integrated without someone else's work.

From Documentation/maintainer/rebasing-and-merging.rst

  Rebasing
  ========
  
  "Rebasing" is the process of changing the history of a series of commits
  within a repository.  There are two different types of operations that are
  referred to as rebasing since both are done with the ``git rebase``
  command, but there are significant differences between them:
  
   - Changing the parent (starting) commit upon which a series of patches is
     built.  For example, a rebase operation could take a patch set built on
     the previous kernel release and base it, instead, on the current
     release.  We'll call this operation "reparenting" in the discussion
     below.
  
   - Changing the history of a set of patches by fixing (or deleting) broken
     commits, adding patches, adding tags to commit changelogs, or changing
     the order in which commits are applied.  In the following text, this
     type of operation will be referred to as "history modification"
  
  The term "rebasing" will be used to refer to both of the above operations.
  Used properly, rebasing can yield a cleaner and clearer development
  history; used improperly, it can obscure that history and introduce bugs.
  
  There are a few rules of thumb that can help developers to avoid the worst
  perils of rebasing:
  
   - History that has been exposed to the world beyond your private system
     should usually not be changed.  Others may have pulled a copy of your
     tree and built on it; modifying your tree will create pain for them.  If
     work is in need of rebasing, that is usually a sign that it is not yet
     ready to be committed to a public repository.
  
     That said, there are always exceptions.  Some trees (linux-next being
     a significant example) are frequently rebased by their nature, and
     developers know not to base work on them.  Developers will sometimes
     expose an unstable branch for others to test with or for automated
     testing services.  If you do expose a branch that may be unstable in
     this way, be sure that prospective users know not to base work on it.
  
   - Do not rebase a branch that contains history created by others.  If you
     have pulled changes from another developer's repository, you are now a
     custodian of their history.  You should not change it.  With few
     exceptions, for example, a broken commit in a tree like this should be
     explicitly reverted rather than disappeared via history modification.
  
   - Do not reparent a tree without a good reason to do so.  Just being on a
     newer base or avoiding a merge with an upstream repository is not
     generally a good reason.
  
   - If you must reparent a repository, do not pick some random kernel commit
     as the new base.  The kernel is often in a relatively unstable state
     between release points; basing development on one of those points
     increases the chances of running into surprising bugs.  When a patch
     series must move to a new base, pick a stable point (such as one of
     the -rc releases) to move to.
  
   - Realize that reparenting a patch series (or making significant history
     modifications) changes the environment in which it was developed and,
     likely, invalidates much of the testing that was done.  A reparented
     patch series should, as a general rule, be treated like new code and
     retested from the beginning.
  
  A frequent cause of merge-window trouble is when Linus is presented with a
  patch series that has clearly been reparented, often to a random commit,
  shortly before the pull request was sent.  The chances of such a series
  having been adequately tested are relatively low - as are the chances of
  the pull request being acted upon.
  
  If, instead, rebasing is limited to private trees, commits are based on a
  well-known starting point, and they are well tested, the potential for
  trouble is low.

